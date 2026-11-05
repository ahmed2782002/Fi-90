import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:fii90/feature/auction_round/presentation/view/widgets/auction_setup.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_setup_cubit.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/play_sheet/play_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// First stop of a single auction challenge: the player sets the match up,
/// then picks who to play against.
class AuctionSetupScreen extends StatelessWidget {
  const AuctionSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuctionSetupCubit(),
      child: BlocBuilder<AuctionSetupCubit, AuctionConfig>(
        builder: (context, config) => SubPage(
          title: context.tr(AppStrings.modeAuction),
          children: [
            AuctionSetup(
              config: config,
              onChanged: context.read<AuctionSetupCubit>().update,
              startLabel: context.tr(AppStrings.chooseOpponent),
              onStart: () => PlaySheet.show(
                context,
                modeKey: AppStrings.modeAuction,
                auction: config,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
