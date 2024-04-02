part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularError extends PopularState {
  final String? messageError;

  PopularError({required this.messageError});
}

final class PopularLoaded extends PopularState {
  final int? statusCode;
  final ModelPopular? popular;

  PopularLoaded({required this.statusCode, required this.popular});
}
