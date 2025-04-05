import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FormWidget renders children and uses formKey', (tester) async {
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, __) => MaterialApp(
          home: FormWidget(
            formKey: formKey,
            children: const [
              Text('Test Field'),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Test Field'), findsOneWidget);
    expect(formKey.currentState, isNotNull);
  });
}
