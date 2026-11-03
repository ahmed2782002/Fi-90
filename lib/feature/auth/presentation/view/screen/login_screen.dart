import 'package:fii90/core/localization/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/routing/nav.dart';
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
import 'package:fii90/feature/layout/presentation/view/screen/layout_screen.dart';
import 'package:fii90/feature/legal/mock_model/legal_section.dart';
import 'package:fii90/feature/legal/presentation/view/screen/legal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (_, s) => s.status != LoginStatus.idle,
        listener: (context, state) {
          switch (state.status) {
            case LoginStatus.signedIn:
              Nav.replace(context, const LayoutScreen());
            case LoginStatus.terms:
              Nav.push(
                context,
                const LegalScreen(
                  titleKey: AppStrings.termsAndConditions,
                  sections: LegalSection.terms,
                ),
              );
              context.read<LoginCubit>().reset();
            case LoginStatus.privacy:
              Nav.push(
                context,
                const LegalScreen(
                  titleKey: AppStrings.privacyPolicy,
                  sections: LegalSection.privacy,
                ),
              );
              context.read<LoginCubit>().reset();
            case LoginStatus.idle:
              break;
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body: AppBackground(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppGradients.fade(
                  AppColors.pri,
                  x: .5,
                  y: 0,
                  rx: .9,
                  ry: .35,
                  alpha: .16,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 39.h, 24.w, 10.h),
                  child: Builder(
                    builder: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: BrandLogo.small(),
                        ),
                        SizedBox(height: 26.h),
                        // Keep the header one line per locale so the stage
                        // below gets the same height in Arabic and English.
                        _OneLine(
                          context.tr(AppStrings.loginTitle),
                          style: AppText.loginTitle,
                        ),
                        SizedBox(height: 6.h),
                        _OneLine(
                          context.tr(AppStrings.loginSubtitle),
                          style: AppText.loginSubtitle,
                        ),
                        SizedBox(height: 26.h),
                        const Expanded(child: PlayerCardStage()),
                        SizedBox(height: 26.h),
                        SocialButton(
                          label: context.tr(AppStrings.loginGoogle),
                          icon: AppIcons.google,
                          iconWidth: 22,
                          background: AppColors.white,
                          foreground: AppColors.googleText,
                          onTap: context.read<LoginCubit>().signInWithGoogle,
                        ),
                        SizedBox(height: 12.h),
                        SocialButton(
                          label: context.tr(AppStrings.loginApple),
                          icon: AppIcons.apple,
                          iconWidth: 20,
                          background: AppColors.black,
                          foreground: AppColors.white,
                          border: AppColors.tint(AppColors.white, .22),
                          onTap: context.read<LoginCubit>().signInWithApple,
                        ),
                        SizedBox(height: 16.h),
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

class _OneLine extends StatelessWidget {
  const _OneLine(this.text, {required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text, style: style, maxLines: 1),
    );
  }
}
