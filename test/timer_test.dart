import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindful_task_pro/screens/MyTimer.dart'; // Replace with the actual import path

void main() {
  testWidgets('Countdown Timer Test', (WidgetTester tester) async {
    // Build the widget and trigger a frame.
    await tester.pumpWidget(MyTimer());

    // Ensure that the initial time remaining is 0.
    expect(find.text('Time remaining: 0'), findsOneWidget);

    // Enter 5 seconds in the text field.
    await tester.enterText(find.byType(TextField), '5');

    // Tap the "Start" button.
    await tester.tap(find.text('Start'));
    await tester.pump();

    // Wait for the timer to count down from 5 to 0.
    await tester.pump(Duration(seconds: 5));

    // Ensure that the time remaining is now 0.
    expect(find.text('Time remaining: 0'), findsOneWidget);
  });
}
