part of 'movie_detail_cubit.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final String message;

  MovieDetailSuccess(this.message);
}

class MovieDetailFailure extends MovieDetailState {
  final String error;

  MovieDetailFailure(this.error);
}
