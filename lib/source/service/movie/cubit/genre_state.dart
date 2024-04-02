part of 'genre_cubit.dart';

@immutable
sealed class GenreState {}

final class GenreInitial extends GenreState {}

final class GenreLoading extends GenreState {}

final class GenreError extends GenreState {
  final String? messageError;

  GenreError({required this.messageError});
}

final class GenreLoaded extends GenreState {
  final int? statusCode;
  final ModelGenre? genre;

  GenreLoaded({required this.statusCode, required this.genre});
}
