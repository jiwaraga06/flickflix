import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flickflix/source/Model/modelPopular.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:meta/meta.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final MovieRepository? movieRepository;
  PopularCubit({required this.movieRepository}) : super(PopularInitial());

  void popular(page) {
    emit(PopularLoading());
    movieRepository!.popular(page).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("Popular: $json");
      emit(PopularLoaded(statusCode: statusCode, popular: modelPopularFromJson(jsonEncode(json))));
    });
  }
}
