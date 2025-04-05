import 'package:flight_booking_app/src/features/booking_flight/domain/entities/flight_entity.dart';

class FlightModel extends FlightEntity {
  const FlightModel({
    required super.id,
    required super.airline,
    required super.flightNumber,
    required super.departure,
    required super.arrival,
    required super.price,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
    id: json['id'],
    airline: json['airline'],
    flightNumber: json['flight_number'],
    departure: json['departure'],
    arrival: json['arrival'],
    price: json['price']?.toString(),
  );
}
