import 'package:assessment_app/controller/model/movie_detail_model.dart';
import 'package:assessment_app/controller/model/movie_search_model.dart';
import 'package:assessment_app/controller/model/movie_videos_model.dart';
import 'package:assessment_app/controller/model/movies_category_model.dart';
import 'package:assessment_app/controller/model/movies_list_model.dart';

class MoviesController {
  /// Movies List Data Controller -> when API hit successfully!
  static MoviesModel? moviesModel;

  /// Movie Detail Data Controller -> when API hit successfully!
  static MovieDetailModel? movieDetailModel;

  /// Movie Video Data Controller -> when API hit successfully!
  static MovieVideosModel? movieVideosModel;

  /// Movie Category Data Controller -> when API hit successfully!
  static MovieCategoryModel? movieCategoryModel;

  /// Movie Search Data Controller -> when API hit successfully!
  static MovieSearchModel? movieSearchModel;
}
