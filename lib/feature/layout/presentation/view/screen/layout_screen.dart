import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/widgets/app_toast/app_toast.dart';
import 'package:fii90/feature/friendship/presentation/view_model/friendship_cubit.dart';
import 'package:fii90/feature/friendship/presentation/view_model/friendship_state.dart';
import 'package:fii90/feature/plans/presentation/view_model/plans_cubit.dart';
import 'package:fii90/feature/plans/presentation/view_model/plans_state.dart';
import 'package:fii90/feature/profile/presentation/view_model/profile_state.dart';
import 'package:fii90/core/widgets/app_background/app_background.dart';
import 'package:fii90/feature/friends/presentation/view/screen/friends_screen.dart';
import 'package:fii90/feature/home/presentation/view/screen/home_screen.dart';
import 'package:fii90/feature/journey/presentation/view/screen/journey_screen.dart';
import 'package:fii90/feature/journey/presentation/view_model/journey_cubit.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/app_nav_bar.dart';
import 'package:fii90/feature/layout/presentation/view/widgets/play_sheet/play_sheet.dart';
import 'package:fii90/feature/layout/presentation/view_model/layout_cubit.dart';
import 'package:fii90/feature/layout/presentation/view_model/layout_state.dart';
import 'package:fii90/feature/profile/presentation/view/screen/profile_screen.dart';
import 'package:fii90/feature/profile/presentation/view_model/profile_cubit.dart';
import 'package:fii90/feature/sound/presentation/view_model/sound_cubit.dart';
import 'package:fii90/feature/sound/presentation/view_model/sound_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LayoutCubit()),
        BlocProvider(create: (_) => JourneyCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => PlansCubit()),
        BlocProvider(create: (_) => FriendshipCubit()),
        BlocProvider(create: (_) => SoundCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProfileCubit, ProfileState>(
            listenWhen: (_, s) => s.toast != null,
            listener: (context, s) => AppToast.show(context, s.toast!),
          ),
          BlocListener<PlansCubit, PlansState>(
            listenWhen: (_, s) => s.toast != null,
            listener: (context, s) => AppToast.show(context, s.toast!),
          ),
          BlocListener<SoundCubit, SoundState>(
            listenWhen: (_, s) => s.toast != null,
            listener: (context, s) => AppToast.show(context, s.toast!),
          ),
          BlocListener<FriendshipCubit, FriendshipState>(
            listenWhen: (_, s) => s.toast != null,
            listener: (context, s) => AppToast.show(context, s.toast!),
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColors.bg,
          body: AppBackground(
            child: BlocBuilder<LayoutCubit, LayoutState>(
              builder: (context, state) => Stack(
                children: [
                  Positioned.fill(
                    child: IndexedStack(
                      index: state.tab.index,
                      children: const [
                        HomeScreen(),
                        FriendsScreen(),
                        JourneyScreen(),
                        ProfileScreen(),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 22,
                    child: AppNavBar(
                      tab: state.tab,
                      onSelect: context.read<LayoutCubit>().select,
                      onPlay: () => PlaySheet.show(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
