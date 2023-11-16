part of 'movie_search_cubit.dart';

@immutable
abstract class MovieSearchState {}

class MovieSearchInitial extends MovieSearchState {}

class MovieSearchLoading extends MovieSearchState {}

class MovieSearchSuccess extends MovieSearchState {
  final String message;

  MovieSearchSuccess(this.message);
}

class MovieSearchFailure extends MovieSearchState {
  final String error;

  MovieSearchFailure(this.error);
}
