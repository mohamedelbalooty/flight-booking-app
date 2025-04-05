import 'package:dartz/dartz.dart';
import 'package:flight_booking_app/src/core/errors/exceptions.dart';
import 'package:flight_booking_app/src/core/errors/failures.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/data_source/flight_data_source.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/entities/flight_entity.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/repositories/flights_repository.dart';

class FlightsRepositoryImpl implements FlightsRepository {
  final FlightDataSource dataSource;

  FlightsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<FlightEntity>>> getFlights({
    required String from,
    required String to,
    required String date,
  }) async {
    try {
      final flights = await dataSource.fetchFlights(
        from: from,
        to: to,
        date: date,
      );
      return Right(flights);
    } on AppException catch (e) {
      return Left(mapExceptionToFailure(e));
    }
  }
}
