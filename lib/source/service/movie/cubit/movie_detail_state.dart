part of 'movie_detail_cubit.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailLoading extends MovieDetailState {}

final class MovieDetailError extends MovieDetailState {
  final String? messageError;

  MovieDetailError({required this.messageError});
}

final class MovieDetailLoaded extends MovieDetailState {
  final int? statusCode;
  final ModelMovieDetail? movieDetail;

  MovieDetailLoaded({required this.statusCode, required this.movieDetail});
}
