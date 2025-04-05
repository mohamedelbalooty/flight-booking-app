part of 'search_flight_cubit.dart';

@immutable
sealed class SearchFlightState {}

final class SearchFlightInitial extends SearchFlightState {}

final class SearchFlightSelectDate extends SearchFlightState {}

final class SearchFlightSuccess extends SearchFlightState {
  final String from;
  final String to;
  final String date;

  SearchFlightSuccess({
    required this.from,
    required this.to,
    required this.date,
  });
}
