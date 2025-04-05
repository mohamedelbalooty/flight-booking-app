import 'package:flight_booking_app/src/core/extensions/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_flight_state.dart';

class SearchFlightCubit extends Cubit<SearchFlightState> {
  SearchFlightCubit() : super(SearchFlightInitial());

  static SearchFlightCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final departureController = TextEditingController();
  final destinationController = TextEditingController();
  final travelDateController = TextEditingController();

  void searchFlight() {
    _unFocus();
    if (formKey.currentState!.validate()) {
      emit(
        SearchFlightSuccess(
          from: departureController.text,
          to: destinationController.text,
          date: travelDateController.text,
        ),
      );
      departureController.clear();
      destinationController.clear();
      travelDateController.clear();
    }
  }

  void selectTravelDate(BuildContext context) async {
    final date = await _showDatePicker(context);
    if (date != null) {
      travelDateController.text = date.toEeeDdMmmYyyy();
    }
  }

  Future<DateTime?> _showDatePicker(
    BuildContext context, {
    DateTime? firstDate,
    DateTime? lastDate,
  }) async => await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: firstDate ?? DateTime(1950),
    lastDate: lastDate ?? DateTime.now(),
  );

  void _unFocus() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  Future<void> close() {
    departureController.dispose();
    destinationController.dispose();
    travelDateController.dispose();
    return super.close();
  }
}
