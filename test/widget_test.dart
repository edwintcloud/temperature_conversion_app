// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:temperature_conversion_app/main.dart';

void main() {
  testWidgets('Temperature Calculator App test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our app has two radio buttons.
    final Type radioT = const Radio<bool>().runtimeType;
    expect(find.byType(radioT), findsNWidgets(2));

    // Verify that our app has one input field.
    expect(find.byType(TextField), findsOneWidget);

    // Verify that our app has a Calculate button.
    expect(find.text('Calculate'), findsOneWidget);
  });
}
