import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/theme/gradients.dart';
import 'package:fii90/core/widgets/app_background/app_background.dart';
import 'package:fii90/core/widgets/brand_logo/brand_logo.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/login_terms.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/player_card_stage.dart';
import 'package:fii90/feature/auth/presentation/view/widgets/social_button.dart';
import 'package:fii90/feature/auth/presentation/view_model/login_cubit.dart';
import 'package:fii90/feature/auth/presentation/view_model/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (_, s) => s.message != null,
        listener: (context, state) => ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(state.message!, style: AppText.toast),
            backgroundColor: AppColors.s2,
            behavior: SnackBarBehavior.floating,
          )),
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body: AppBackground(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppGradients.fade(AppColors.pri,
                    x: .5, y: 0, rx: .9, ry: .35, alpha: .16),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 39, 24, 10),
                  child: Builder(
                    builder: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: BrandLogo.small(),
                        ),
                        const SizedBox(height: 26),
                        Text('سجّل وابدأ التحدي', style: AppText.loginTitle),
                        const SizedBox(height: 6),
                        Text('حسابك بيحفظ مستواك وترتيبك وسجل مبارياتك.',
                            style: AppText.loginSubtitle),
                        const SizedBox(height: 26),
                        const Expanded(child: PlayerCardStage()),
                        const SizedBox(height: 26),
                        SocialButton(
                          label: 'المتابعة بـ Google',
                          icon: AppIcons.google,
                          iconWidth: 22,
                          background: AppColors.white,
                          foreground: AppColors.googleText,
                          onTap: context.read<LoginCubit>().signInWithGoogle,
                        ),
                        const SizedBox(height: 12),
                        SocialButton(
                          label: 'المتابعة بـ Apple',
                          icon: AppIcons.apple,
                          iconWidth: 20,
                          background: AppColors.black,
                          foreground: AppColors.white,
                          border: AppColors.tint(AppColors.white, .22),
                          onTap: context.read<LoginCubit>().signInWithApple,
                        ),
                        const SizedBox(height: 16),
                        const LoginTerms(),
                      ],
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
