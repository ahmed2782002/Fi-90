import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/app_background/app_background.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/feature/auction_round/presentation/view/screen/auction_screen.dart';
import 'package:fii90/feature/buzzer_round/presentation/view/screen/buzzer_screen.dart';
import 'package:fii90/feature/comeback_round/presentation/view/screen/comeback_screen.dart';
import 'package:fii90/feature/final_result/presentation/view/screen/final_result_screen.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:fii90/feature/match/presentation/view_model/match_cubit.dart';
import 'package:fii90/feature/match/presentation/view_model/match_state.dart';
import 'package:fii90/feature/match_vs/presentation/view/screen/vs_screen.dart';
import 'package:fii90/feature/matchmaking/presentation/view/screen/matchmaking_screen.dart';
import 'package:fii90/feature/round_intro/presentation/view/screen/round_intro_screen.dart';
import 'package:fii90/feature/round_result/presentation/view/screen/round_result_screen.dart';
import 'package:fii90/feature/trivia_round/presentation/view/screen/trivia_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({
    super.key,
    required this.modes,
    this.vsAi = false,
    this.aiLevel = AiLevel.normal,
    this.fromRoom = false,
  });

  final List<MatchMode> modes;
  final bool vsAi;
  final AiLevel aiLevel;
  final bool fromRoom;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MatchCubit(
        modes: modes,
        vsAi: vsAi,
        aiLevel: aiLevel,
        fromRoom: fromRoom,
      ),
      child: BlocConsumer<MatchCubit, MatchState>(
        listenWhen: (a, b) => b.toast != null || b.stage == MatchStage.exit,
        listener: (context, state) {
          final toast = state.toast;
          if (toast != null) AppToast.show(context, toast);
          if (state.stage == MatchStage.exit) Navigator.of(context).pop();
        },
        buildWhen: (a, b) => a.stage != b.stage || a.roundKey != b.roundKey,
        builder: (context, state) => Scaffold(
          backgroundColor: AppColors.bg,
          resizeToAvoidBottomInset: true,
          body: AppBackground(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: KeyedSubtree(
                key: ValueKey((state.stage, state.roundKey)),
                child: switch (state.stage) {
                  MatchStage.search => const MatchmakingScreen(),
                  MatchStage.vs => const VsScreen(),
                  MatchStage.intro => const RoundIntroScreen(),
                  MatchStage.round => switch (state.mode) {
                    MatchMode.trivia => const TriviaScreen(),
                    MatchMode.auction => const AuctionScreen(),
                    MatchMode.buzzer => const BuzzerScreen(),
                    MatchMode.comeback => const ComebackScreen(),
                  },
                  MatchStage.roundResult => const RoundResultScreen(),
                  MatchStage.finished ||
                  MatchStage.exit => const FinalResultScreen(),
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
