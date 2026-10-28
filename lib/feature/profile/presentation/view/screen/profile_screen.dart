import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/auth/presentation/view/screen/login_screen.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/logout_button.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/logout_sheet.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/support_settings.dart';
import 'package:fii90/feature/legal/mock_model/legal_section.dart';
import 'package:fii90/feature/complaint/presentation/view/screen/complaint_screen.dart';
import 'package:fii90/feature/faq/presentation/view/screen/faq_screen.dart';
import 'package:fii90/feature/legal/presentation/view/screen/legal_screen.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/performance_card.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/profile_hero_card.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/profile_settings.dart';
import 'package:fii90/feature/profile/presentation/view/widgets/profile_stats.dart';
import 'package:fii90/feature/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ProfileCubit>();
    final profile = cubit.profile;
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(18, 9, 18, 110),
        children: [
          ProfileHeroCard(
            profile: profile,
            name: cubit.state.name ?? context.tr(profile.nameKey),
          ),
          const SizedBox(height: 14),
          ProfileStats(profile: profile),
          const SizedBox(height: 14),
          PerformanceCard(items: profile.performance),
          const SizedBox(height: 20),
          const ProfileSettings(),
          const SizedBox(height: 16),
          SupportSettings(
            onComplaint: () => Nav.push(context, const ComplaintScreen()),
            onFaq: () => Nav.push(context, const FaqScreen()),
            onPrivacy: () => Nav.push(
              context,
              const LegalScreen(
                titleKey: AppStrings.privacyPolicy,
                sections: LegalSection.privacy,
              ),
            ),
            onTerms: () => Nav.push(
              context,
              const LegalScreen(
                titleKey: AppStrings.termsAndConditions,
                sections: LegalSection.terms,
              ),
            ),
          ),
          const SizedBox(height: 14),
          LogoutButton(
            onTap: () => LogoutSheet.show(
              context,
              onConfirm: () => Nav.resetTo(context, const LoginScreen()),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            '${context.tr(AppStrings.appName)} · v1.0.0',
            textAlign: TextAlign.center,
            style: AppText.version,
          ),
        ],
      ),
    );
  }
}
