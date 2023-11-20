import 'package:assessment_app/controller/data_controller/movies_controller.dart';
import 'package:assessment_app/controller/model/movie_detail_model.dart';
import 'package:assessment_app/utils/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  /// Fetch Movie Details
  movieDetails({required String movieId}) async {
    /// emitting the loading state
    emit(MovieDetailLoading());

    try {
      /// hitting the API
      var headers = {
        'Authorization': 'Bearer ${Constants.token}',
        'accept': 'application/json'
      };
      var request = http.Request(
          'GET', Uri.parse('https://api.themoviedb.org/3/movie/$movieId'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        /// Convert API response to Movie Details Model
        /// Here the Data will saved in the Controller,
        /// So when the success state is emitted
        /// then the data will be fetched from the controller
        MoviesController.movieDetailModel =
            movieDetailModelFromJson(await response.stream.bytesToString());
        emit(MovieDetailSuccess('Movie Details fetched successfully!'));
      } else {
        /// if the api status code other the 200
        print(response.reasonPhrase);
        emit(MovieDetailFailure('Error: ${response.reasonPhrase}'));
      }
    } on Exception catch (e) {
      /// if we get an exception on the hitting of the API
      print('Exception in Movie Details API: $e');
      emit(MovieDetailFailure('Error: $e'));
    }
  }
}
