import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ButtonWidget triggers onPressed', (tester) async {
    bool tapped = false;

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, __) => MaterialApp(
          home: Scaffold(
            body: ButtonWidget(
              buttonTitle: 'Search',
              onPressed: () => tapped = true,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Search'));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
