part of 'nowplaying_cubit.dart';

@immutable
sealed class NowplayingState {}

final class NowplayingInitial extends NowplayingState {}

final class NowplayingLoading extends NowplayingState {}

final class NowplayingError extends NowplayingState {
  final String? messageError;

  NowplayingError({required this.messageError});
}

final class NowplayingLoaded extends NowplayingState {
  final int? statusCode;
  final ModelNowPlaying? nowPlaying;

  NowplayingLoaded({required this.statusCode, required this.nowPlaying});
}
