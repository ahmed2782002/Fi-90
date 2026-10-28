import 'package:fii90/feature/faq/mock_model/faq_item.dart';
import 'package:fii90/feature/faq/presentation/view_model/faq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(const FaqState());

  List<FaqItem> get items => [
    for (final item in FaqItem.mock)
      if (item.category == state.category) item,
  ];

  bool isOpen(FaqItem item) => state.open == FaqItem.mock.indexOf(item);

  void selectCategory(int index) => emit(FaqState(category: index, open: null));

  void toggle(FaqItem item) => emit(
    FaqState(
      category: state.category,
      open: isOpen(item) ? null : FaqItem.mock.indexOf(item),
    ),
  );
}
