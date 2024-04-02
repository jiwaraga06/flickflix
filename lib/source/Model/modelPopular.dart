// To parse this JSON data, do
//
//     final modelPopular = modelPopularFromJson(jsonString);

import 'dart:convert';

ModelPopular modelPopularFromJson(String str) => ModelPopular.fromJson(json.decode(str));


class ModelPopular {
    final int? page;
    final List<Result>? results;
    final int? totalPages;
    final int? totalResults;

    ModelPopular({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory ModelPopular.fromJson(Map<String, dynamic> json) => ModelPopular(
        page: json["page"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

}

class Result {
    final bool? adult;
    final String? backdropPath;
    final List<int>? genreIds;
    final int? id;
    final String? originalLanguage;
    final String? originalTitle;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final String? releaseDate;
    final String? title;
    final bool? video;
    final double? voteAverage;
    final int? voteCount;

    Result({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );


}
