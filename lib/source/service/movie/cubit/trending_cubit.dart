import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flickflix/source/Model/modelTrending.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:meta/meta.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final MovieRepository? movieRepository;
  TrendingCubit({required this.movieRepository}) : super(TrendingInitial());

  void trending() {
    emit(TrendingLoading());
    movieRepository!.tranding().then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("Trending: $json");
      emit(TrendingLoaded(statusCode: statusCode, trending: modelTrendingFromJson(jsonEncode(json))));
    });
  }
}
