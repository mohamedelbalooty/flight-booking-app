import 'package:flight_booking_app/src/features/booking_flight/domain/entities/flight_entity.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/use_cases/get_flights_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'available_flights_state.dart';

class AvailableFlightsCubit extends Cubit<AvailableFlightsState> {
  final GetFlightsUseCase getFlights;

  AvailableFlightsCubit({required this.getFlights})
    : super(AvailableFlightsInitial());

  static AvailableFlightsCubit get(context) => BlocProvider.of(context);

  late String _from;
  late String _to;
  late String _date;

  void initializeSearchData({
    required String from,
    required String to,
    required String date,
  }) {
    _from = from;
    _to = to;
    _date = date;
    // getSearchedFlights();
    getSearchedFlightsLocal();
  }

  void getSearchedFlights() async {
    emit(AvailableFlightsLoading());
    final result = await getFlights.call(from: _from, to: _to, date: _date);
    result.fold(
      (failure) => emit(AvailableFlightsError(message: failure.message)),
      (flights) {
        if (flights.isEmpty) {
          emit(AvailableFlightsEmpty());
        } else {
          emit(AvailableFlightsLoaded(flights: flights));
        }
      },
    );
  }

  /// For testing purposes
  void getSearchedFlightsLocal() async {
    emit(AvailableFlightsLoading());
    await Future.delayed(const Duration(seconds: 4));
    final mockFlights = [
      FlightEntity(
        id: '1',
        airline: 'Air XYZ',
        flightNumber: 'XYZ123',
        departure: '10:00 AM',
        arrival: '2:00 PM',
        price: '250',
      ),
      FlightEntity(
        id: '2',
        airline: 'SkyJet',
        flightNumber: 'SJ789',
        departure: '1:00 PM',
        arrival: '5:00 PM',
        price: '220',
      ),
      FlightEntity(
        id: '3',
        airline: 'Air India',
        flightNumber: 'AI456',
        departure: '6:00 PM',
        arrival: '9:00 PM',
        price: '300',
      ),
      FlightEntity(
        id: '4',
        airline: 'Air Canada',
        flightNumber: 'AC789',
        departure: '7:00 AM',
        arrival: '11:00 AM',
        price: '280',
      ),
      FlightEntity(
        id: '5',
        airline: 'EgyptAir',
        flightNumber: 'JB123',
        departure: '3:00 PM',
        arrival: '7:00 PM',
        price: '260',
      ),
    ];
    emit(AvailableFlightsLoaded(flights: mockFlights));
  }
}
