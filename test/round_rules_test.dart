import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_cubit.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:fii90/feature/comeback_round/presentation/view_model/comeback_cubit.dart';
import 'package:fii90/feature/match/mock_model/round_result.dart';
import 'package:fii90/feature/trivia_round/mock_model/trivia_question.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_cubit.dart';
import 'package:fii90/feature/trivia_round/presentation/view_model/trivia_state.dart';
import 'package:flutter_test/flutter_test.dart';

/// Rule checks driven on the fake clock of [testWidgets].
void main() {
  testWidgets('comeback: 2 attempts each, both wrong twice = draw', (
    tester,
  ) async {
    // skill 0 → the AI always guesses wrong.
    final cubit = ComebackCubit(
      question: 0,
      skill: 0,
      oppKey: 'opp',
      meScore: 0,
      oppScore: 0,
    );
    for (final guess in ['xx', 'yy']) {
      cubit.input.text = guess;
      cubit.submit();
      await tester.pump(const Duration(milliseconds: 700));
    }
    expect(cubit.attemptsLeft(MatchSide.me), 0);
    expect(cubit.canType, isFalse, reason: 'input locked after 2 tries');

    cubit.input.text = 'zz';
    cubit.submit();
    await tester.pump(const Duration(milliseconds: 700));
    expect(cubit.attemptsUsed(MatchSide.me), 2, reason: '3rd try ignored');

    for (var i = 0; i < 19 && !cubit.state.done; i++) {
      await tester.pump(const Duration(seconds: 1));
    }
    expect(cubit.state.done, isTrue);
    expect(
      cubit.state.elapsed,
      lessThan(ComebackCubit.totalSeconds),
      reason: 'ended by the attempt rule, not the timer',
    );
    expect(cubit.attemptsUsed(MatchSide.opp), 2);
    expect(cubit.state.result?.winner, isNull);
    expect(cubit.state.result?.points, 0);
    await cubit.close();
  });

  testWidgets('trivia: a repeated answer is a strike, not a free retry', (
    tester,
  ) async {
    final question = TriviaQuestion.mock.first;
    final cubit = TriviaCubit(question: question, skill: 0, oppKey: 'opp');
    Future<void> untilMyTurn() async {
      for (var i = 0; i < 40 && !cubit.myTurn; i++) {
        await tester.pump(const Duration(milliseconds: 250));
      }
      expect(cubit.myTurn, isTrue);
    }

    final answer = question.answers.first.name.ar;
    await untilMyTurn();
    cubit.input.text = answer;
    cubit.submit();
    await tester.pump(const Duration(milliseconds: 800));
    expect(cubit.state.submitted.length, 1);

    await untilMyTurn(); // AI (skill 0) answers wrong, turn comes back
    final before = cubit.state.strikes[MatchSide.me]!;
    cubit.input.text = answer;
    cubit.submit();
    await tester.pump(const Duration(milliseconds: 800));
    expect(cubit.state.strikes[MatchSide.me], before + 1);
    expect(cubit.state.feedback?.kind, FeedbackKind.dup);
    expect(cubit.state.current, MatchSide.opp, reason: 'turn passes');
    await cubit.close();
  });

  testWidgets('auction: no setup flash, typed bid must beat the price', (
    tester,
  ) async {
    final cubit = AuctionCubit(skill: .5, config: const AuctionConfig());
    expect(
      cubit.state.phase,
      isNot(AuctionPhase.setup),
      reason: 'pre-configured auction opens the first lot immediately',
    );

    await tester.pump(const Duration(milliseconds: 4800));
    expect(cubit.myBidTurn, isTrue);
    final price = cubit.state.price;

    cubit.bidTo(price); // equal → rejected
    expect(cubit.state.price, price);
    cubit.bidTo(cubit.maxBid + 1); // over budget → rejected
    expect(cubit.state.price, price);

    cubit.bidTo(price + 14);
    expect(cubit.state.price, price + 14);
    expect(cubit.state.holder, MatchSide.me);
    expect(cubit.state.turn, MatchSide.opp);
    await cubit.close();
  });
}
