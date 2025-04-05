import 'package:dio/dio.dart';
import 'package:flight_booking_app/src/core/constants/api_constants.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/data_source/flight_data_source.dart';
import 'package:flight_booking_app/src/features/booking_flight/data/models/flight_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late FlightDataSource dataSource;

  setUp(() {
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dataSource = FlightDataSourceImpl(dio: dio);
  });

  test('should return a list of FlightModel on success', () async {
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
      ApiConstants.flights,
      queryParameters: {"from": "Cairo", "to": "Dubai", "date": "2025-04-01"},
      (request) => request.reply(200, mockData),
    );

    final result = await dataSource.fetchFlights(
      from: "Cairo",
      to: "Dubai",
      date: "2025-04-01",
    );

    expect(result, isA<List<FlightModel>>());
    expect(result.length, 1);
    expect(result.first.airline, "Air XYZ");
  });
}
