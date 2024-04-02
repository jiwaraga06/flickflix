import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flickflix/source/Model/modelMovieDetail.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:meta/meta.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final MovieRepository? movieRepository;
  MovieDetailCubit({required this.movieRepository}) : super(MovieDetailInitial());

  void movieDetail(movieId) {
    emit(MovieDetailLoading());
    movieRepository!.detailMovie(movieId).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("Movie Detail: $json");
      emit(MovieDetailLoaded(statusCode: statusCode, movieDetail: modelMovieDetailFromJson(jsonEncode(json))));
    });
  }
}
