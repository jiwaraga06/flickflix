import 'package:dio/dio.dart';
import 'package:flickflix/source/Env/env.dart';
import 'package:flickflix/source/network/api.dart';

class Network {
  Dio dio = Dio();

  Future nowPlaying(page) async {
    try {
      var url = Api.nowPlaying(page);
      Response response = await dio.get(url,
          options: Options(
            headers: {ACCEPT: APPLICATION_JSON, CONTENT_TYPE: APPLICATION_JSON, AUTHORIZATION: 'Bearer $token'},
          ));
      errorHttp = "";
      return response;
    } on Error catch (e) {
      errorHttp = e.toString();
    }
  }

  Future popular(page) async {
    try {
      var url = Api.popular(page);
      Response response = await dio.get(url,
          options: Options(
            headers: {ACCEPT: APPLICATION_JSON, CONTENT_TYPE: APPLICATION_JSON, AUTHORIZATION: 'Bearer $token'},
          ));
      errorHttp = "";
      return response;
    } on Error catch (e) {
      errorHttp = e.toString();
    }
  }

  Future upcoming(page) async {
    try {
      var url = Api.upcoming(page);
      Response response = await dio.get(url,
          options: Options(
            headers: {ACCEPT: APPLICATION_JSON, CONTENT_TYPE: APPLICATION_JSON, AUTHORIZATION: 'Bearer $token'},
          ));
      errorHttp = "";
      return response;
    } on Error catch (e) {
      errorHttp = e.toString();
    }
  }

  Future genre() async {
    try {
      var url = Api.genre();
      Response response = await dio.get(url,
          options: Options(
            headers: {ACCEPT: APPLICATION_JSON, CONTENT_TYPE: APPLICATION_JSON, AUTHORIZATION: 'Bearer $token'},
          ));
      errorHttp = "";
      return response;
    } on Error catch (e) {
      errorHttp = e.toString();
    }
  }

  Future detailMovie(movieId) async {
    try {
      var url = Api.detailMovie(movieId);
      Response response = await dio.get(url,
          options: Options(
            headers: {ACCEPT: APPLICATION_JSON, CONTENT_TYPE: APPLICATION_JSON, AUTHORIZATION: 'Bearer $token'},
          ));
      errorHttp = "";
      return response;
    } on Error catch (e) {
      errorHttp = e.toString();
    }
  }
  Future detailMovieVideo(movieId) async {
    try {
      var url = Api.detailMovieVideo(movieId);
      Response response = await dio.get(url,
          options: Options(
            headers: {ACCEPT: APPLICATION_JSON, CONTENT_TYPE: APPLICATION_JSON, AUTHORIZATION: 'Bearer $token'},
          ));
      errorHttp = "";
      return response;
    } on Error catch (e) {
      errorHttp = e.toString();
    }
  }

  Future tranding() async {
    try {
      var url = Api.tranding();
      Response response = await dio.get(url,
          options: Options(
            headers: {ACCEPT: APPLICATION_JSON, CONTENT_TYPE: APPLICATION_JSON, AUTHORIZATION: 'Bearer $token'},
          ));
      errorHttp = "";
      return response;
    } on Error catch (e) {
      errorHttp = e.toString();
    }
  }
}
