import 'package:easy_localization/easy_localization.dart';
import 'package:flight_booking_app/src/features/booking_flight/domain/entities/flight_entity.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/flight_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await EasyLocalization.ensureInitialized();

  testWidgets('FlightCardWidget displays flight info and handles tap', (
    WidgetTester tester,
  ) async {
    bool tapped = false;

    final flight = FlightEntity(
      id: '123',
      airline: 'Air Test',
      flightNumber: 'AT456',
      departure: '09:00 AM',
      arrival: '12:00 PM',
      price: '299',
    );

    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        useOnlyLangCode: true,
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          child: MaterialApp(
            locale: const Locale('en'),
            home: Scaffold(
              body: FlightCardWidget(
                flight: flight,
                onTap: () => tapped = true,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('123'), findsOneWidget);
    expect(find.text('Air Test'), findsOneWidget);
    expect(find.text('09:00 AM'), findsOneWidget);
    expect(find.text('12:00 PM'), findsOneWidget);
    expect(find.text('299 \$'), findsOneWidget);
    expect(find.text('book_now'.tr()), findsOneWidget);

    await tester.tap(find.byType(FlightCardWidget));
    expect(tapped, isTrue);
  });
}
