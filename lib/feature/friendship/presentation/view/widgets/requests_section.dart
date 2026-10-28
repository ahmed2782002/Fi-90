import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/feature/friendship/mock_model/buddy.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/buddy_tile.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/round_action.dart';
import 'package:flutter/material.dart';

class RequestsSection extends StatelessWidget {
  const RequestsSection({
    super.key,
    required this.requests,
    required this.onAccept,
    required this.onDecline,
  });

  final List<Buddy> requests;
  final ValueChanged<Buddy> onAccept;
  final ValueChanged<Buddy> onDecline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
          child: Text(
            context.tr(AppStrings.requestsHeader, args: ['${requests.length}']),
            style: AppText.listHeader,
          ),
        ),
        for (final r in requests) ...[
          const SizedBox(height: 16),
          BuddyTile(
            name: context.tr(r.name),
            subtitle: 'LV ${r.level} · ${context.tr(r.tierKey ?? '')}',
            subtitleColor: AppColors.mu,
            background: r.background,
            foreground: r.foreground,
            highlighted: true,
            actions: [
              RoundAction(
                label: context.tr(AppStrings.accept),
                glyph: '✓',
                style: AppText.acceptMark,
                filled: AppColors.ok,
                onTap: () => onAccept(r),
              ),
              RoundAction(
                label: context.tr(AppStrings.decline),
                glyph: '✕',
                style: AppText.declineMark,
                onTap: () => onDecline(r),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
