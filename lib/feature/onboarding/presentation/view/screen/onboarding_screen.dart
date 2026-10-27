import 'package:fii90/core/animation/enter.dart';
import 'package:fii90/core/animation/fx.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/app_background/app_background.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/auth/presentation/view/screen/login_screen.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/challenges_slide/challenges_slide.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/onboarding_header.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/page_dots.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/ranking_slide/ranking_slide.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/slide_layout.dart';
import 'package:fii90/feature/onboarding/presentation/view/widgets/versus_slide/versus_slide.dart';
import 'package:fii90/feature/onboarding/presentation/view_model/onboarding_cubit.dart';
import 'package:fii90/feature/onboarding/presentation/view_model/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listenWhen: (a, b) => !a.finished && b.finished,
        listener: (context, _) => Nav.replace(context, const LoginScreen()),
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return Scaffold(
            backgroundColor: AppColors.bg,
            body: AppBackground(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppGradients.fade(AppColors.pri,
                      x: .5, y: .3, rx: 1, ry: .45, alpha: .2),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 8, 22, 16),
                    child: Column(
                      children: [
                        OnboardingHeader(onSkip: cubit.skip),
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onHorizontalDragEnd: (d) => cubit.swipe(
                              d.primaryVelocity ?? 0,
                              isRtl: Directionality.of(context) == TextDirection.rtl,
                            ),
                            child: KeyedSubtree(
                              key: ValueKey(state.index),
                              child: Enter(
                                fx: Fx.fadeIn,
                                duration: const Duration(milliseconds: 350),
                                child: SlideLayout(
                                  title: cubit.slide.title,
                                  body: cubit.slide.body,
                                  illustration: switch (state.index) {
                                    0 => const VersusSlide(),
                                    1 => const ChallengesSlide(),
                                    _ => const RankingSlide(),
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        PageDots(count: cubit.slides.length, index: state.index),
                        const SizedBox(height: 22),
                        PrimaryButton(label: cubit.buttonLabel, onTap: cubit.next),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
