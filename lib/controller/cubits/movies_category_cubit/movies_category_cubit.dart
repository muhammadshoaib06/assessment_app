import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/controller/model/movies_category_model.dart';
import 'package:assessment_app/utils/constants.dart';
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
        'Authorization': 'Bearer ${Constants.token}',
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
