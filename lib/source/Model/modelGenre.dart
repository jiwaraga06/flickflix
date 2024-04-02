// To parse this JSON data, do
//
//     final modelGenre = modelGenreFromJson(jsonString);

import 'dart:convert';

ModelGenre modelGenreFromJson(String str) => ModelGenre.fromJson(json.decode(str));


class ModelGenre {
  final List<Genre>? genres;

  ModelGenre({this.genres});

  factory ModelGenre.fromJson(Map<String, dynamic> json) => ModelGenre(
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      );
}

class Genre {
  final int? id;
  final String? name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );
}
