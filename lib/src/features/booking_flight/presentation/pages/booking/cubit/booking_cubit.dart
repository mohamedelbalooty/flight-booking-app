import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  static BookingCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  void bookFlight() {
    _unFocus();
    if (formKey.currentState!.validate()) {
      emit(BookingSuccess());
      nameController.clear();
      emailController.clear();
      phoneController.clear();
    }
  }

  void _unFocus() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
