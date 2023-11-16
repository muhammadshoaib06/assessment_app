import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/controller/model/movie_search_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit() : super(MovieSearchInitial());

  searchMovie({required String query}) async {
    emit(MovieSearchLoading());

    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYTZiZTVjMDcwMjM3MzkzNDM5MWM5YWZiYzJkMGU5NyIsInN1YiI6IjY1NTRmMWM2ZDRmZTA0MDBjNDIxYzhhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4RvoNtvEGfF-p3vzFf4bsNesjFUu6nlL0s7eOvTFV08',
        'accept': 'application/json'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://api.themoviedb.org/3/search/movie?query=$query&language=en-US&page=1'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        MoviesController.movieSearchModel =
            movieSearchModelFromJson(await response.stream.bytesToString());
        emit(MovieSearchSuccess('Search completed!'));
      } else {
        print(response.reasonPhrase);
        emit(MovieSearchFailure('Error: ${response.reasonPhrase}'));
      }
    } on Exception catch (e) {
      emit(MovieSearchFailure('Error: $e'));
    }
  }
}
