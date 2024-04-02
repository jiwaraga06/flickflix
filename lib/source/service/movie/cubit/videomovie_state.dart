part of 'videomovie_cubit.dart';

@immutable
sealed class VideomovieState {}

final class VideomovieInitial extends VideomovieState {}

final class VideomovieLoading extends VideomovieState {}

final class VideomovieError extends VideomovieState {
  final String? messageError;

  VideomovieError({required this.messageError});
}

final class VideomovieLoaded extends VideomovieState {
  final int? statusCode;
  final ModelMovieDetailVideo? movieDetailVideo;

  VideomovieLoaded({required this.statusCode, required this.movieDetailVideo});
}
