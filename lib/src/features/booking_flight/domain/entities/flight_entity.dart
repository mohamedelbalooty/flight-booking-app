import 'package:equatable/equatable.dart';

class FlightEntity extends Equatable {
  final String? id;
  final String? airline;
  final String? flightNumber;
  final String? departure;
  final String? arrival;
  final String? price;

  const FlightEntity({
    required this.id,
    required this.airline,
    required this.flightNumber,
    required this.departure,
    required this.arrival,
    required this.price,
  });

  @override
  List<Object?> get props => [
    id,
    airline,
    flightNumber,
    departure,
    arrival,
    price,
  ];
}
