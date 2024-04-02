// To parse this JSON data, do
//
//     final modelMovieDetailVideo = modelMovieDetailVideoFromJson(jsonString);

import 'dart:convert';

ModelMovieDetailVideo modelMovieDetailVideoFromJson(String str) => ModelMovieDetailVideo.fromJson(json.decode(str));

class ModelMovieDetailVideo {
  final int? id;
  final List<Result>? results;

  ModelMovieDetailVideo({
    this.id,
    this.results,
  });

  factory ModelMovieDetailVideo.fromJson(Map<String, dynamic> json) => ModelMovieDetailVideo(
        id: json["id"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      );
}

class Result {
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final String? id;

  Result({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.id,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        iso6391: json["iso_639_1"],
        iso31661: json["iso_3166_1"],
        name: json["name"],
        key: json["key"],
        site: json["site"],
        size: json["size"],
        type: json["type"],
        official: json["official"],
        id: json["id"],
      );
}
