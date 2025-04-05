import 'package:easy_localization/easy_localization.dart';
import 'package:flight_booking_app/src/core/navigation/app_routes.dart';
import 'package:flight_booking_app/src/core/utils/app_colors.dart';
import 'package:flight_booking_app/src/core/utils/app_size.dart';
import 'package:flight_booking_app/src/core/utils/app_styles.dart';
import 'package:flight_booking_app/src/core/utils/app_validators.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/pages/search_flight/cubit/search_flight_cubit.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/button_widget.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/form_widget.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchFlightPage extends StatelessWidget {
  const SearchFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SearchFlightCubit, SearchFlightState>(
        listener: (context, state) {
          if (state is SearchFlightSuccess) {
            context.push(
              AppRoutes.availableFlights,
              extra: {'from': state.from, 'to': state.to, 'date': state.date},
            );
          }
        },
        builder: (context, state) {
          final cubit = SearchFlightCubit.get(context);
          return FormWidget(
            formKey: cubit.formKey,
            children: [
              SizedBox(height: kBottomNavigationBarHeight + 10.h),
              Transform.rotate(
                angle: 1.3,
                child: Icon(
                  Icons.airplanemode_active,
                  size: 100.sp,
                  color: AppColors.secondaryColor,
                ),
              ),
              AppSize.vGap4,
              Text(
                'search_flight'.tr(),
                style: AppStyles.primaryStyle(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                ),
              ),
              AppSize.vGap8,
              Container(
                key: const Key('divider'),
                color: AppColors.secondaryColor,
                height: 2.5,
                width: 100.w,
              ),
              AppSize.vGap20,
              TextInputWidget(
                label: 'from'.tr(),
                hint: 'enter_city_or_airport'.tr(),
                icon: Icons.airplanemode_active_rounded,
                controller: cubit.departureController,
                onValidate:
                    (value) => AppValidators.emptyValidator(
                      value,
                      label: 'city_or_airport'.tr(),
                    ),
              ),
              AppSize.vGap16,
              TextInputWidget(
                label: 'to'.tr(),
                hint: 'enter_city_or_airport'.tr(),
                icon: Icons.roundabout_right_rounded,
                controller: cubit.destinationController,
                onValidate:
                    (value) => AppValidators.emptyValidator(
                      value,
                      label: 'city_or_airport'.tr(),
                    ),
              ),
              AppSize.vGap16,
              TextInputWidget(
                label: 'travel_date'.tr(),
                hint: 'select_date'.tr(),
                icon: Icons.date_range_rounded,
                controller: cubit.travelDateController,
                readOnly: true,
                onTap: () => cubit.selectTravelDate(context),
                onValidate:
                    (value) => AppValidators.emptyValidator(
                      value,
                      label: 'travel_date'.tr(),
                    ),
              ),
              AppSize.vGap32,
              ButtonWidget(
                buttonTitle: 'search'.tr(),
                onPressed: () => cubit.searchFlight(),
              ),
            ],
          );
        },
      ),
    );
  }
}
