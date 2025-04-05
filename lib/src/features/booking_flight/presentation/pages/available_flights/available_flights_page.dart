import 'package:easy_localization/easy_localization.dart';
import 'package:flight_booking_app/src/core/navigation/app_routes.dart';
import 'package:flight_booking_app/src/core/utils/app_size.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/available_flights/cubit/available_flights_cubit.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/appbar_widget.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/empty_widget.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/exception_widget.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/flight_card_widget.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AvailableFlightsPage extends StatelessWidget {
  const AvailableFlightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: 'available_flights'.tr(),
        centerTitle: false,
        toolbarHeight: 70.h,
      ),
      body: BlocBuilder<AvailableFlightsCubit, AvailableFlightsState>(
        builder: (context, state) {
          final cubit = AvailableFlightsCubit.get(context);
          switch (state) {
            case AvailableFlightsInitial():
            case AvailableFlightsLoading():
              return const LoadingWidget();
            case AvailableFlightsEmpty():
              return const EmptyWidget();
            case AvailableFlightsLoaded():
              return RefreshIndicator(
                onRefresh: () async => cubit.getSearchedFlights(),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  itemBuilder:
                      (_, index) => FlightCardWidget(
                        flight: state.flights[index],
                        onTap:
                            () => context.push(
                              AppRoutes.bookingFlight,
                              extra: {'flight': state.flights[index]},
                            ),
                      ),
                  separatorBuilder: (_, index) => AppSize.vGap12,
                  itemCount: state.flights.length,
                ),
              );
            case AvailableFlightsError():
              return ExceptionWidget(
                message: state.message,
                onRetry: cubit.getSearchedFlights,
              );
          }
        },
      ),
    );
  }
}
