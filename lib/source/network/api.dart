import 'package:flickflix/source/Env/env.dart';

class Api {
  static nowPlaying(page) {
    return "$baseUrl/movie/now_playing?language=en-US&page=$page";
  }

  static popular(page) {
    return "$baseUrl/movie/popular?language=en-US&page=$page";
  }

  static upcoming(page) {
    return "$baseUrl/movie/upcoming?language=en-US&page=$page";
  }

  static genre() {
    return "$baseUrl/genre/movie/list?language=en";
  }

  static detailMovie(movieId) {
    return "$baseUrl/movie/$movieId?language=en-US";
  }

  static detailMovieVideo(movieId) {
    return "$baseUrl/movie/$movieId/videos?language=en-US";
  }

  static tranding() {
    return "$baseUrl//trending/movie/day?language=en-US";
  }
}
