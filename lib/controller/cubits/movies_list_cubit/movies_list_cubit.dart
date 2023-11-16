import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/controller/model/movies_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit() : super(MoviesListInitial());

  initialState() => emit(MoviesListInitial());

  /// Fetch All Movies List
  fetchMovies() async {
    emit(MoviesListLoading());
    try {
      var headers = {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYTZiZTVjMDcwMjM3MzkzNDM5MWM5YWZiYzJkMGU5NyIsInN1YiI6IjY1NTRmMWM2ZDRmZTA0MDBjNDIxYzhhNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4RvoNtvEGfF-p3vzFf4bsNesjFUu6nlL0s7eOvTFV08',
        'accept': 'application/json'
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        MoviesController.moviesModel =
            moviesModelFromJson(await response.stream.bytesToString());
        emit(MoviesListSuccess('Movies fetched successfully!'));
      } else {
        print(response.reasonPhrase);
        emit(MoviesListFailure('Error: ${response.reasonPhrase}'));
      }
    } on Exception catch (e) {
      emit(MoviesListFailure('Error: $e'));
    }
  }
}
