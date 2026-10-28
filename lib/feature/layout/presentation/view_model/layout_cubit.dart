import 'package:fii90/feature/layout/presentation/view_model/layout_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(const LayoutState());

  void select(LayoutTab tab) {
    if (tab != state.tab) emit(LayoutState(tab: tab));
  }
}
