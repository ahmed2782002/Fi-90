import 'package:fii90/core/localization/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/auth/presentation/view_model/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTerms extends StatelessWidget {
  const LoginTerms({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Text.rich(
      TextSpan(
        style: AppText.terms,
        children: [
          TextSpan(text: context.tr(AppStrings.loginTermsPrefix)),
          TextSpan(
            text: context.tr(AppStrings.termsAndConditions),
            recognizer: cubit.termsRecognizer,
            style: AppText.termsLink,
          ),
          TextSpan(text: context.tr(AppStrings.loginTermsAnd)),
          TextSpan(
            text: context.tr(AppStrings.privacyPolicy),
            recognizer: cubit.privacyRecognizer,
            style: AppText.termsLink,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
