part of 'movies_list_cubit.dart';

@immutable
abstract class MoviesListState {}

class MoviesListInitial extends MoviesListState {}

class MoviesListLoading extends MoviesListState {}

class MoviesListSuccess extends MoviesListState {
  final String message;

  MoviesListSuccess(this.message);
}

class MoviesListFailure extends MoviesListState {
  final String error;

  MoviesListFailure(this.error);
}
