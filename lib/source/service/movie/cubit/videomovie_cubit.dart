import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flickflix/source/Model/modelVideoMovie.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:meta/meta.dart';

part 'videomovie_state.dart';

class VideomovieCubit extends Cubit<VideomovieState> {
  final MovieRepository? movieRepository;
  VideomovieCubit({required this.movieRepository}) : super(VideomovieInitial());

  void videoMovide(movieId) {
    emit(VideomovieLoading());
    movieRepository!.detailMovieVideo(movieId).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("Detail Video: $json");
      emit(VideomovieLoaded(statusCode: statusCode, movieDetailVideo: modelMovieDetailVideoFromJson(jsonEncode(json))));
    });
  }
}
