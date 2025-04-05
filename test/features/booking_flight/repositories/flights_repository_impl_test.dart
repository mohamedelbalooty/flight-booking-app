import 'package:dartz/dartz.dart';
import 'package:flight_booking_app/src/core/errors/exceptions.dart';
import 'package:flight_booking_app/src/core/errors/failures.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/data_source/flight_data_source.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/models/flight_model.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/repositories/flights_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFlightDataSource extends Mock implements FlightDataSource {}

void main() {
  late FlightsRepositoryImpl repository;
  late MockFlightDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockFlightDataSource();
    repository = FlightsRepositoryImpl(dataSource: mockDataSource);
  });

  const from = 'Cairo';
  const to = 'Dubai';
  const date = '2025-04-05';

  final mockFlights = [
    FlightModel(
      id: '1',
      airline: 'Air XYZ',
      flightNumber: 'XYZ123',
      departure: '10:00 AM',
      arrival: '2:00 PM',
      price: '250',
    ),
  ];

  test(
    'should return Right(List<FlightEntity>) when dataSource returns data',
    () async {
      when(
        () => mockDataSource.fetchFlights(from: from, to: to, date: date),
      ).thenAnswer((_) async => mockFlights);
      final result = await repository.getFlights(
        from: from,
        to: to,
        date: date,
      );
      expect(result, Right(mockFlights));
      verify(
        () => mockDataSource.fetchFlights(from: from, to: to, date: date),
      ).called(1);
    },
  );

  test(
    'should return Left(Failure) when dataSource throws AppException',
    () async {
      when(
        () => mockDataSource.fetchFlights(from: from, to: to, date: date),
      ).thenThrow(const NetworkException());
      final result = await repository.getFlights(
        from: from,
        to: to,
        date: date,
      );
      expect(
        result,
        Left(
          Failure(message: 'No Internet Connection', type: FailureType.network),
        ),
      );
    },
  );
}
