part of 'trending_cubit.dart';

@immutable
sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingError extends TrendingState {
  final String? messageError;

  TrendingError({required this.messageError});
}

final class TrendingLoaded extends TrendingState {
  final int? statusCode;
  final ModelTrending? trending;

  TrendingLoaded({required this.statusCode, required this.trending});
}
