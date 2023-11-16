part of 'movies_category_cubit.dart';

@immutable
abstract class MoviesCategoryState {}

class MoviesCategoryInitial extends MoviesCategoryState {}

class MoviesCategoryLoading extends MoviesCategoryState {}

class MoviesCategorySuccess extends MoviesCategoryState {
  final String message;

  MoviesCategorySuccess(this.message);
}

class MoviesCategoryFailure extends MoviesCategoryState {
  final String error;

  MoviesCategoryFailure(this.error);
}
