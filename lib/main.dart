import 'package:easy_localization/easy_localization.dart';
import 'package:flight_booking_app/src/flight_booking_app.dart'
    show FlightBookingApp;
import 'package:flight_booking_app/src/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      child: const FlightBookingApp(),
    ),
  );
}
