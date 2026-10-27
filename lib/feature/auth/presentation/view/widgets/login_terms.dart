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
          const TextSpan(text: 'بالمتابعة إنت موافق على '),
          TextSpan(
            text: 'الشروط والأحكام',
            recognizer: cubit.termsRecognizer,
            style: AppText.termsLink,
          ),
          const TextSpan(text: ' و'),
          TextSpan(
            text: 'سياسة الخصوصية',
            recognizer: cubit.privacyRecognizer,
            style: AppText.termsLink,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
