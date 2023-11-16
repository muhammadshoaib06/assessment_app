part of 'get_movie_trailer_video_key_cubit.dart';

@immutable
abstract class GetMovieTrailerVideoKeyState {}

class GetMovieTrailerVideoKeyInitial extends GetMovieTrailerVideoKeyState {}

class GetMovieTrailerVideoKeyLoading extends GetMovieTrailerVideoKeyState {}

class GetMovieTrailerVideoKeySuccess extends GetMovieTrailerVideoKeyState {
  final String message;

  GetMovieTrailerVideoKeySuccess(this.message);
}

class GetMovieTrailerVideoKeyFailure extends GetMovieTrailerVideoKeyState {
  final String error;

  GetMovieTrailerVideoKeyFailure(this.error);
}
