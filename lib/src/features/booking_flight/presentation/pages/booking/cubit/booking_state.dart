part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingSuccess extends BookingState {}
