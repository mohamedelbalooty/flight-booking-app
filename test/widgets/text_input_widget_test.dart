import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TextInputWidget renders and handles input', (tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (_, __) => MaterialApp(
          home: Scaffold(
            body: TextInputWidget(
              label: 'Name',
              hint: 'Enter your name',
              icon: Icons.person,
              controller: controller,
            ),
          ),
        ),
      ),
    );

    expect(find.text('Name'), findsOneWidget);
    expect(find.byIcon(Icons.person), findsOneWidget);

    await tester.enterText(find.byType(TextFormField), 'Ahmed');
    expect(controller.text, 'Ahmed');
  });
}
