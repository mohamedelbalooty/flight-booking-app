import 'package:flight_booking_app/src/core/navigation/app_routes.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/use_cases/get_flights_use_case.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/available_flights/available_flights_page.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/available_flights/cubit/available_flights_cubit.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/booking/booking_page.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/booking/cubit/booking_cubit.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/search_flight/cubit/search_flight_cubit.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/search_flight/search_flight_page.dart';
import 'package:flight_booking_app/src/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.searchFlight,
    routes: [
      GoRoute(
        path: AppRoutes.searchFlight,
        builder:
            (context, state) => BlocProvider(
              create: (_) => SearchFlightCubit(),
              child: const SearchFlightPage(),
            ),
      ),
      GoRoute(
        path: AppRoutes.availableFlights,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return BlocProvider(
            create:
                (_) => AvailableFlightsCubit(
                  getFlights: locator<GetFlightsUseCase>(),
                )..initializeSearchData(
                  from: extra?['from'] ?? '',
                  to: extra?['to'] ?? '',
                  date: extra?['date'] ?? '',
                ),
            child: const AvailableFlightsPage(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.bookingFlight,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return BlocProvider(
            create: (_) => BookingCubit(),
            child: BookingPage(flight: extra?['flight']),
          );
        },
      ),
    ],
  );
}
