import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/controller/model/movie_videos_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'get_movie_trailer_video_key_state.dart';

class GetMovieTrailerVideoKeyCubit extends Cubit<GetMovieTrailerVideoKeyState> {
  GetMovieTrailerVideoKeyCubit() : super(GetMovieTrailerVideoKeyInitial());

  getTrailerKey({required String movieId}) async {
    emit(GetMovieTrailerVideoKeyLoading());

    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYTZiZTVjMDcwMjM3MzkzNDM5MWM5YWZiYzJkMGU5NyIsInN1YiI6IjY1NTRmMWM2ZDRmZTA0MDBjNDIxYzhhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4RvoNtvEGfF-p3vzFf4bsNesjFUu6nlL0s7eOvTFV08',
        'accept': 'application/json'
      };
      var request = http.Request('GET',
          Uri.parse('https://api.themoviedb.org/3/movie/$movieId/videos'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        MoviesController.movieVideosModel =
            movieVideosModelFromJson(await response.stream.bytesToString());
        emit(GetMovieTrailerVideoKeySuccess('Trailer Url get successfully'));
      } else {
        print(response.reasonPhrase);
        emit(GetMovieTrailerVideoKeyFailure('Error: ${response.reasonPhrase}'));
      }
    } on Exception catch (e) {
      emit(GetMovieTrailerVideoKeyFailure('Error: $e'));
    }
  }
}
