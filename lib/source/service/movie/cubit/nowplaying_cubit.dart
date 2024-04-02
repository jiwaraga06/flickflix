import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flickflix/source/Model/modelNowPlaying.dart';
import 'package:flickflix/source/repository/movieRepository.dart';
import 'package:meta/meta.dart';

part 'nowplaying_state.dart';

class NowplayingCubit extends Cubit<NowplayingState> {
  final MovieRepository? movieRepository;
  NowplayingCubit({required this.movieRepository}) : super(NowplayingInitial());

  void nowPlaying(page) {
    emit(NowplayingLoading());
    movieRepository!.nowPlaying(page).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print('Now Playing \n $json');
      emit(NowplayingLoaded(statusCode: statusCode, nowPlaying: modelNowPlayingFromJson(jsonEncode(json))));
    });
  }
}
