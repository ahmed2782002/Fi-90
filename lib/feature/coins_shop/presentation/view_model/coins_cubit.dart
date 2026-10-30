import 'package:easy_localization/easy_localization.dart';
import 'package:fii90/core/localization/app_strings.dart';
import 'package:fii90/core/widgets/app_toast/toast_message.dart';
import 'package:fii90/feature/coins_shop/mock_model/coin_pack.dart';
import 'package:fii90/feature/coins_shop/presentation/view_model/coins_state.dart';
import 'package:fii90/feature/home/mock_model/home_summary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsCubit extends Cubit<CoinsState> {
  CoinsCubit() : super(CoinsState(coins: HomeSummary.mock.coins));

  final packs = CoinPack.mock;

  static final _format = NumberFormat.decimalPattern('en');

  String format(int value) => _format.format(value);

  void buy(CoinPack pack) => emit(
    CoinsState(
      coins: state.coins + pack.total,
      toast: ToastMessage(
        AppStrings.coinsAddedToast,
        args: [format(pack.total)],
      ),
    ),
  );
}
