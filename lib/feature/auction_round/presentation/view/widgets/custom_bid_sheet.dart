import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/primary_button.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_cubit.dart';
import 'package:fii90/feature/auction_round/presentation/view_model/auction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Number-pad sheet for typing an exact bid. Only values above the current
/// price and within the player's budget are accepted; the sheet closes on
/// its own if the bidding turn ends while it is open.
class CustomBidSheet extends StatefulWidget {
  const CustomBidSheet({super.key});

  static Future<void> show(BuildContext context) {
    final cubit = context.read<AuctionCubit>();
    if (!cubit.myBidTurn) return Future.value();
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.scrim,
      builder: (_) =>
          BlocProvider.value(value: cubit, child: const CustomBidSheet()),
    );
  }

  @override
  State<CustomBidSheet> createState() => _CustomBidSheetState();
}

class _CustomBidSheetState extends State<CustomBidSheet> {
  final _controller = TextEditingController();
  String? _error;
  var _closed = false;

  /// Pops this sheet exactly once (never the page underneath it).
  void _close() {
    if (_closed || !mounted) return;
    _closed = true;
    // Already dismissed by the user (swipe / barrier tap) → nothing to pop.
    if (ModalRoute.of(context)?.isCurrent != true) return;
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit(AuctionCubit cubit) {
    final price = cubit.state.price;
    final amount = int.tryParse(_controller.text.trim());
    if (amount == null || amount <= price) {
      setState(
        () => _error = context.tr(AppStrings.customBidTooLow, args: ['$price']),
      );
      return;
    }
    if (amount > cubit.maxBid) {
      setState(() => _error = context.tr(AppStrings.budgetShort));
      return;
    }
    _close();
    cubit.bidTo(amount);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuctionCubit>();
    return BlocListener<AuctionCubit, AuctionState>(
      // Turn timed out / phase moved on while typing → close the sheet.
      listener: (_, _) {
        if (!cubit.myBidTurn) _close();
      },
      child: BlocBuilder<AuctionCubit, AuctionState>(
        buildWhen: (a, b) => a.price != b.price || a.turn != b.turn,
        builder: (context, state) {
          final min = state.price + 1;
          final max = cubit.maxBid;
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(18.w, 12.h, 18.w, 20.h),
              decoration: BoxDecoration(
                color: AppColors.bg2,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
                border: Border.all(color: AppColors.line),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: AppColors.line2,
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      context.tr(AppStrings.customBidTitle),
                      textAlign: TextAlign.center,
                      style: AppText.feedbackTitle(AppColors.tx, 19),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      context.tr(
                        AppStrings.customBidRange,
                        args: ['$min', '$max'],
                      ),
                      textAlign: TextAlign.center,
                      style: AppText.bidHint,
                    ),
                    SizedBox(height: 14.h),
                    Directionality(
                      // Keeps the amount and its "M" suffix as "15M" in RTL.
                      textDirection: TextDirection.ltr,
                      child: TextField(
                        controller: _controller,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        cursorColor: AppColors.gold,
                        style: AppText.bidPrice,
                        onChanged: (_) {
                          if (_error != null) setState(() => _error = null);
                        },
                        onSubmitted: (_) => _submit(cubit),
                        decoration: InputDecoration(
                          hintText: '$min',
                          hintStyle: AppText.bidPrice.copyWith(
                            color: AppColors.dim,
                          ),
                          suffixText: 'M',
                          suffixStyle: AppText.bidPrice,
                          filled: true,
                          fillColor: AppColors.s1,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.r),
                            borderSide: BorderSide(
                              color: _error == null
                                  ? AppColors.gold
                                  : AppColors.bad,
                              width: 1.5,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.r),
                            borderSide: BorderSide(
                              color: _error == null
                                  ? AppColors.gold
                                  : AppColors.bad,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22.r),
                            borderSide: BorderSide(
                              color: _error == null
                                  ? AppColors.gold
                                  : AppColors.bad,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_error != null) ...[
                      SizedBox(height: 8.h),
                      Text(
                        _error!,
                        textAlign: TextAlign.center,
                        style: AppText.feedbackNote(AppColors.badInk),
                      ),
                    ],
                    SizedBox(height: 14.h),
                    PrimaryButton(
                      label: context.tr(AppStrings.customBidSend),
                      onTap: () => _submit(cubit),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
