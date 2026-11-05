import 'package:fii90/feature/auction_round/mock_model/auction_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Holds the auction choices made before an opponent is picked.
class AuctionSetupCubit extends Cubit<AuctionConfig> {
  AuctionSetupCubit() : super(const AuctionConfig());

  void update(AuctionConfig config) => emit(config);
}
