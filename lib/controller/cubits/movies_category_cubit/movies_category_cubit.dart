import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/controller/model/movies_category_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'movies_category_state.dart';

class MoviesCategoryCubit extends Cubit<MoviesCategoryState> {
  MoviesCategoryCubit() : super(MoviesCategoryInitial());

  fetchMoviesCategory() async {
    emit(MoviesCategoryLoading());

    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYTZiZTVjMDcwMjM3MzkzNDM5MWM5YWZiYzJkMGU5NyIsInN1YiI6IjY1NTRmMWM2ZDRmZTA0MDBjNDIxYzhhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4RvoNtvEGfF-p3vzFf4bsNesjFUu6nlL0s7eOvTFV08',
        'accept': 'application/json'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://api.themoviedb.org/3/genre/movie/list?language=en'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        MoviesController.movieCategoryModel =
            movieCategoryModelFromJson(await response.stream.bytesToString());
        emit(MoviesCategorySuccess('Movies category fetched successfully!'));
      } else {
        print(response.reasonPhrase);
        emit(MoviesCategoryFailure('Error: ${response.reasonPhrase}'));
      }
    } on Exception catch (e) {
      emit(MoviesCategoryFailure('Error: $e'));
    }
  }
}
