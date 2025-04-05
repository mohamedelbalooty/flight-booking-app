part of 'available_flights_cubit.dart';

@immutable
sealed class AvailableFlightsState {}

final class AvailableFlightsInitial extends AvailableFlightsState {}

final class AvailableFlightsLoading extends AvailableFlightsState {}

final class AvailableFlightsEmpty extends AvailableFlightsState {}

final class AvailableFlightsLoaded extends AvailableFlightsState {
  final List<FlightEntity> flights;

  AvailableFlightsLoaded({required this.flights});
}

final class AvailableFlightsError extends AvailableFlightsState {
  final String message;

  AvailableFlightsError({required this.message});
}
