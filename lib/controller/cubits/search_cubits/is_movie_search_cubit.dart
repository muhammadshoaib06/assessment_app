import 'package:bloc/bloc.dart';

class IsMovieSearchCubit extends Cubit<bool?> {
  IsMovieSearchCubit() : super(false);

  isMovieSearch({required bool? value}) => emit(value);
}
