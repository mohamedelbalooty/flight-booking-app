import "package:dartz/dartz.dart";
import 'package:flight_booking_app/src/core/errors/failures.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/entities/flight_entity.dart';

abstract class FlightsRepository {
  Future<Either<Failure, List<FlightEntity>>> getFlights({
    required String from,
    required String to,
    required String date,
  });
}
