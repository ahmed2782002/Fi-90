import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/core/widgets/friends_app/game_layer.dart';
import 'package:fii90/core/widgets/friends_app/judge_buttons.dart';
import 'package:fii90/core/widgets/friends_app/player_score_chip.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/bank_game/mock_model/bank_question.dart';
import 'package:fii90/feature/bank_game/presentation/view/widgets/bank_ladder_card.dart';
import 'package:fii90/feature/bank_game/presentation/view/widgets/bank_question_card.dart';
import 'package:fii90/feature/bank_game/presentation/view/widgets/bank_switch_card.dart';
import 'package:fii90/feature/bank_game/presentation/view_model/bank_game_cubit.dart';
import 'package:fii90/feature/bank_game/presentation/view_model/bank_game_state.dart';
import 'package:fii90/feature/game_end/presentation/view/screen/game_end_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankGameScreen extends StatelessWidget {
  const BankGameScreen({super.key, required this.names, required this.members});

  final List<String> names;
  final List<List<String>> members;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BankGameCubit(names: names, members: members),
      child: BlocConsumer<BankGameCubit, BankGameState>(
        listener: (context, state) {
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
          if (!state.finished) return;
          Nav.replace(
            context,
            GameEndScreen(
              gameTitle: context.tr(AppStrings.gameBankTitle),
              names: names,
              scores: state.banked,
              unit: context.tr(AppStrings.inTheBank),
              subtitle: context.tr(AppStrings.bankEndSub),
              again: BankGameScreen(names: names, members: members),
            ),
          );
        },
        builder: (context, state) {
          final cubit = context.read<BankGameCubit>();
          final q = cubit.question;
          final playing = state.step != BankStep.switchTeam;
          return GameLayer(
            title: context.tr(AppStrings.gameBankTitle),
            subtitle:
                '${names[state.team]} · ${members[state.team].join(context.tr(AppStrings.nameJoiner))}',
            children: [
              Row(
                spacing: 8,
                children: [
                  for (final (i, n) in names.indexed)
                    Expanded(
                      child: PlayerScoreChip(
                        name: n,
                        value: state.banked[i],
                        caption: context.tr(AppStrings.inTheBank),
                        palette: AppColors.player(i),
                        active: state.team == i,
                      ),
                    ),
                ],
              ),
              if (playing) ...[
                BankLadderCard(
                  ladder: BankQuestion.ladder,
                  chain: state.chain,
                  number: state.question + 1,
                  total: BankGameCubit.perTeam,
                  pot: state.pot,
                  canBank: cubit.canBank,
                  onBank: cubit.bank,
                ),
                BankQuestionCard(
                  player: cubit.player,
                  palette: AppColors.player(state.team),
                  levelLabel: context.tr(q.levelKey),
                  levelColor: AppColors.level(q.level),
                  question: q.text.of(context),
                  answer: state.step == BankStep.reveal
                      ? q.answer.of(context)
                      : null,
                ),
                if (state.step == BankStep.ask)
                  PrimaryButton(
                    label: context.tr(AppStrings.answerThenReveal),
                    onTap: cubit.showAnswer,
                    height: 56,
                  )
                else
                  JudgeButtons(
                    okLabel: context.tr(AppStrings.rightCheck),
                    badLabel: context.tr(AppStrings.wrong),
                    onOk: () => cubit.judge(true),
                    onBad: () => cubit.judge(false),
                  ),
                Text(
                  context.tr(AppStrings.bankHint),
                  textAlign: TextAlign.center,
                  style: AppText.bidHint,
                ),
              ] else
                BankSwitchCard(
                  team: names[state.team],
                  banked: state.banked[state.team],
                  lost: state.lost,
                  nextLabel: state.team == 0
                      ? context.tr(AppStrings.startTeamTurn, args: [names[1]])
                      : context.tr(AppStrings.seeResult),
                  onNext: cubit.nextTeam,
                ),
            ],
          );
        },
      ),
    );
  }
}
