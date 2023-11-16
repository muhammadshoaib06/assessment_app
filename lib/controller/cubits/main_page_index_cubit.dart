import 'package:bloc/bloc.dart';

class MainPageIndexCubit extends Cubit<int?> {
  MainPageIndexCubit() : super(1);

  /// Update the Index when user click on a bottom navigation
  /// widget.
  pageIndex({required int? index}) => emit(index);
}
