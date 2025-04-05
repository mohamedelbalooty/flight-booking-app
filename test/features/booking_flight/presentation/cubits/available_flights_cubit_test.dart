import 'package:dio/dio.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/data_source/flight_data_source.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/repositories/flights_repository_impl.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/use_cases/get_flights_use_case.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/available_flights/cubit/available_flights_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late FlightDataSource dataSource;
  late FlightsRepositoryImpl repository;
  late GetFlightsUseCase useCase;
  late AvailableFlightsCubit cubit;

  const endpoint = '/flights';

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://mock-api.com'));
    dioAdapter = DioAdapter(dio: dio);
    dataSource = FlightDataSourceImpl(dio: dio);
    repository = FlightsRepositoryImpl(dataSource: dataSource);
    useCase = GetFlightsUseCase(repository: repository);
    cubit = AvailableFlightsCubit(getFlights: useCase);
  });

  test(
    'should emit Loading then Loaded state when API returns valid data',
    () async {
      final mockData = [
        {
          "id": "1",
          "airline": "Air XYZ",
          "flight_number": "XYZ123",
          "departure": "10:00 AM",
          "arrival": "2:00 PM",
          "price": 250,
        },
      ];

      dioAdapter.onGet(
        endpoint,
        queryParameters: {'from': 'Cairo', 'to': 'Dubai', 'date': '2025-04-05'},
        (server) => server.reply(200, mockData),
      );

      final expectedStates = [
        isA<AvailableFlightsLoading>(),
        isA<AvailableFlightsLoaded>(),
      ];

      expectLater(cubit.stream, emitsInOrder(expectedStates));
      cubit.initializeSearchData(
        from: 'Cairo',
        to: 'Dubai',
        date: '2025-04-05',
      );
    },
  );
}
