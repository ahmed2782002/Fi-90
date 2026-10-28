import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/app_text_field.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/friendship/mock_model/buddy.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/friend_code_card.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/friends_section.dart';
import 'package:fii90/feature/friendship/presentation/view/widgets/requests_section.dart';
import 'package:fii90/feature/friendship/presentation/view_model/friendship_cubit.dart';
import 'package:fii90/feature/friendship/presentation/view_model/friendship_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FriendshipScreen extends StatelessWidget {
  const FriendshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendshipCubit, FriendshipState>(
      builder: (context, state) {
        final cubit = context.read<FriendshipCubit>();
        final requests = cubit.requests;
        return SubPage(
          title: context.tr(AppStrings.friends),
          gap: 16,
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    controller: cubit.searchController,
                    hint: context.tr(AppStrings.friendSearchHint),
                    height: 50,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 8),
                PrimaryButton(
                  label: context.tr(AppStrings.addFriend),
                  height: 50,
                  expand: false,
                  style: AppText.actionButton(14),
                  onTap: cubit.add,
                ),
              ],
            ),
            FriendCodeCard(code: Buddy.code, onShare: cubit.shareCode),
            if (requests.isNotEmpty)
              RequestsSection(
                requests: requests,
                onAccept: cubit.accept,
                onDecline: cubit.decline,
              ),
            FriendsSection(
              friends: cubit.friends,
              onChallenge: cubit.challenge,
            ),
          ],
        );
      },
    );
  }
}
