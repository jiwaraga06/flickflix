import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flickflix/source/Model/modelGenre.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:meta/meta.dart';

part 'genre_state.dart';

class GenreCubit extends Cubit<GenreState> {
  final MovieRepository? movieRepository;
  GenreCubit({required this.movieRepository}) : super(GenreInitial());

  void genre() {
    emit(GenreLoading());
    movieRepository!.genre().then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("Genre : $json");
      emit(GenreLoaded(statusCode: statusCode, genre: modelGenreFromJson(jsonEncode(json))));
    });
  }
}
