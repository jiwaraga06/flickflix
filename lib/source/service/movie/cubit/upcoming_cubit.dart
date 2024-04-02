import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flickflix/source/Model/modelUpComing.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:meta/meta.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  final MovieRepository? movieRepository;
  UpcomingCubit({required this.movieRepository}) : super(UpcomingInitial());

  void upcoming(page) {
    emit(UpcomingLoading());
    movieRepository!.upcoming(page).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("Up Coming: $json");
      emit(UpcomingLoaded(statusCode: statusCode, upComing: modelUpComingFromJson(jsonEncode(json))));
    });
  }
}
