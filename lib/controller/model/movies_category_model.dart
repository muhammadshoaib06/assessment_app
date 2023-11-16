// To parse this JSON data, do
//
//     final movieCategoryModel = movieCategoryModelFromJson(jsonString);

import 'dart:convert';

MovieCategoryModel movieCategoryModelFromJson(String str) =>
    MovieCategoryModel.fromJson(json.decode(str));

String movieCategoryModelToJson(MovieCategoryModel data) =>
    json.encode(data.toJson());

class MovieCategoryModel {
  final List<Genre> genres;

  MovieCategoryModel({
    required this.genres,
  });

  factory MovieCategoryModel.fromJson(Map<String, dynamic> json) =>
      MovieCategoryModel(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
