part of 'upcoming_cubit.dart';

@immutable
sealed class UpcomingState {}

final class UpcomingInitial extends UpcomingState {}

final class UpcomingLoading extends UpcomingState {}

final class UpcomingError extends UpcomingState {
  final String? messageError;

  UpcomingError({required this.messageError});
}

final class UpcomingLoaded extends UpcomingState {
  final int? statusCode;
  final ModelUpComing? upComing;

  UpcomingLoaded({required this.statusCode, required this.upComing});
}
