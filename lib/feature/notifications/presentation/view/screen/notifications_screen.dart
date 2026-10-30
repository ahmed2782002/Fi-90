import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_icons.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/routing/nav.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/press_scale.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/match/mock_model/match_mode.dart';
import 'package:fii90/feature/match/presentation/view/screen/match_screen.dart';
import 'package:fii90/feature/notifications/presentation/view/widgets/invite_actions.dart';
import 'package:fii90/feature/notifications/presentation/view/widgets/notification_card.dart';
import 'package:fii90/feature/notifications/presentation/view_model/notifications_cubit.dart';
import 'package:fii90/feature/notifications/presentation/view_model/notifications_state.dart';
import 'package:fii90/feature/profile/presentation/view_model/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final muted = !context.watch<ProfileCubit>().state.notifications;
    return BlocConsumer<NotificationsCubit, NotificationsState>(
      listenWhen: (_, s) => s.startMatch,
      listener: (context, _) =>
          Nav.popAndPush(context, const MatchScreen(modes: MatchMode.values)),
      builder: (context, state) {
        final cubit = context.read<NotificationsCubit>();
        final groups = [
          (AppStrings.today, cubit.today, 4.0),
          (AppStrings.earlier, cubit.earlier, 8.0),
        ];
        return SubPage(
          title: context.tr(AppStrings.notifications),
          gap: 14,
          action: cubit.unreadCount > 0
              ? PressScale(
                  onTap: cubit.readAll,
                  child: Container(
                    height: 36,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: AppColors.s1,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(color: AppColors.line2),
                    ),
                    child: Text(
                      context.tr(AppStrings.readAll),
                      style: AppText.readAll,
                    ),
                  ),
                )
              : null,
          children: [
            if (muted)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.tint(AppColors.gold, .12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.tint(AppColors.gold, .4)),
                ),
                child: Text(
                  context.tr(AppStrings.notificationsMuted),
                  style: AppText.notificationsMuted,
                ),
              ),
            for (final (label, items, top) in groups)
              if (items.isNotEmpty) ...[
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, top, 8, 0),
                  child: Text(
                    context.tr(label),
                    style: AppText.notificationsGroup,
                  ),
                ),
                for (final n in items)
                  NotificationCard(
                    glyph:
                        n.kind.glyph ?? context.tr(n.nameKey!).characters.first,
                    tile: n.kind.tile,
                    tileGradient: n.kind.tileGradient,
                    ink: n.kind.ink,
                    title: context.tr(
                      n.titleKey,
                      args: [if (n.nameKey != null) context.tr(n.nameKey!)],
                    ),
                    time: context.tr(n.timeKey, args: n.timeArgs),
                    body: context.tr(
                      n.bodyKey,
                      args: [if (n.nameKey != null) context.tr(n.nameKey!)],
                    ),
                    points: n.points,
                    unread: cubit.isUnread(n),
                    onTap: () => cubit.markRead(n),
                    actions: n.isInvite
                        ? InviteActions(
                            acceptLabel: context.tr(AppStrings.playNow),
                            declineLabel: context.tr(AppStrings.later),
                            onAccept: () => cubit.accept(n),
                            onDecline: () => cubit.decline(n),
                          )
                        : null,
                  ),
              ],
            if (cubit.isEmpty)
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.notification,
                      width: 56,
                      height: 56,
                      colorFilter: ColorFilter.mode(
                        AppColors.dim,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      context.tr(AppStrings.noNotifications),
                      style: AppText.emptyTitle,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      context.tr(AppStrings.noNotificationsHint),
                      textAlign: TextAlign.center,
                      style: AppText.emptyHint,
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
