import "package:dartz/dartz.dart";
import 'package:flight_booking_app/src/core/errors/failures.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/entities/flight_entity.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/repositories/flights_repository.dart';

class GetFlightsUseCase {
  final FlightsRepository repository;

  GetFlightsUseCase({required this.repository});

  Future<Either<Failure, List<FlightEntity>>> call({
    required String from,
    required String to,
    required String date,
  }) => repository.getFlights(from: from, to: to, date: date);
}
