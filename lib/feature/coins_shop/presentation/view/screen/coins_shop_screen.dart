import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/constants/app_images.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/theme/app_colors.dart';
import 'package:fii90/core/theme/app_text.dart';
import 'package:fii90/core/widgets/sub_page.dart';
import 'package:fii90/feature/coins_shop/presentation/view/widgets/coin_balance_card.dart';
import 'package:fii90/feature/coins_shop/presentation/view/widgets/coin_pack_card.dart';
import 'package:fii90/feature/coins_shop/presentation/view_model/coins_cubit.dart';
import 'package:fii90/feature/coins_shop/presentation/view_model/coins_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinsShopScreen extends StatelessWidget {
  const CoinsShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinsCubit, CoinsState>(
      builder: (context, state) {
        final cubit = context.read<CoinsCubit>();
        final cards = [
          for (final pack in cubit.packs)
            CoinPackCard(
              amount: cubit.format(pack.amount),
              bonus: pack.bonus > 0
                  ? context.tr(AppStrings.coinsGift, args: ['${pack.bonus}'])
                  : null,
              price: context.tr(AppStrings.priceEgpDecimal, args: [pack.price]),
              coinSize: pack.coinSize,
              tag: pack.tag.labelKey == null
                  ? null
                  : context.tr(pack.tag.labelKey!),
              tagColor: pack.tag.color,
              tagInk: pack.tag.ink,
              tagGlow: pack.tag.glow,
              onTap: () => cubit.buy(pack),
            ),
        ];
        return SubPage(
          title: context.tr(AppStrings.shopTitle),
          gap: 16,
          children: [
            CoinBalanceCard(coins: cubit.format(state.coins)),
            Padding(
              padding: EdgeInsets.only(top: 6.h),
              child: Column(
                children: [
                  for (var i = 0; i < cards.length; i += 2) ...[
                    if (i > 0) SizedBox(height: 14.h),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(child: cards[i]),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: i + 1 < cards.length
                                ? cards[i + 1]
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.s2,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(AppImages.coin90),
                    width: 26.r,
                    height: 26.r,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        style: AppText.shopTip,
                        children: [
                          TextSpan(text: context.tr(AppStrings.freeCoinsTip)),
                          TextSpan(text: '+10', style: AppText.shopTipValue),
                          TextSpan(
                            text: context.tr(AppStrings.freeCoinsTipEnd),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              context.tr(AppStrings.shopNotice),
              textAlign: TextAlign.center,
              style: AppText.shopNotice,
            ),
          ],
        );
      },
    );
  }
}
