import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/app_background/app_background.dart';
import 'package:fii90/core/widgets/app_background/tiled_svg.dart';
import 'package:fii90/feature/onboarding/presentation/view/screen/onboarding_screen.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/load_bar.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/splash_hero.dart';
import 'package:fii90/feature/splash/presentation/view/widgets/splash_warm_up.dart';
import 'package:fii90/feature/splash/presentation/view_model/splash_cubit.dart';
import 'package:fii90/feature/splash/presentation/view_model/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (_, s) => s.status == SplashStatus.done,
        listener: (context, _) => Nav.replace(context, const OnboardingScreen()),
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body: AppBackground(
            child: Builder(
              builder: (context) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: context.read<SplashCubit>().finish,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: AppGradients.fade(AppColors.cy,
                        x: .5, y: .42, rx: .6, ry: .35, alpha: .22),
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AppGradients.fade(AppColors.pri,
                          x: .5, y: 1, rx: .7, ry: .4, alpha: .3),
                    ),
                    child: BlocBuilder<SplashCubit, SplashState>(
                      buildWhen: (a, b) => a.isWarmingUp != b.isWarmingUp,
                      builder: (context, state) => Stack(
                        fit: StackFit.expand,
                        children: [
                          const TiledSvg(asset: AppImages.starsTile, opacity: .16),
                          if (state.isWarmingUp) const SplashWarmUp(),
                          if (!state.isWarmingUp) const SplashHero(),
                          if (!state.isWarmingUp)
                            Positioned(
                              bottom: 78,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween(begin: 0, end: 1),
                                  duration: SplashCubit.loadDuration,
                                  curve: Curves.easeInOut,
                                  builder: (context, progress, _) =>
                                      LoadBar(progress: progress),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
