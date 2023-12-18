import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_quote_app/main.dart'; // Adjust the import path if necessary

void main() {
  testWidgets('Quote List Display Test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(QuoteApp());

    // Verify the main screen is shown with a title.
    expect(find.text('Quote of the Day'), findsOneWidget);

    // Verify the presence of a ListView, which implies a list of quotes.
    expect(find.byType(ListView), findsOneWidget);

    // If you have a button to navigate to the quote list screen, test its presence.
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Test navigation to the Quote List Screen.
    await tester.tap(find.byType(ElevatedButton));
    await tester
        .pumpAndSettle(); // Wait for the navigation animation to complete.

    // Verify the Quote List Screen is shown.
    expect(find.text('Previous Quotes'), findsOneWidget);

    // If Quote List Screen has a ListView of quotes, verify its presence.
    expect(find.byType(ListTile), findsWidgets);

    // Add more specific tests here according to the functionality of your app.
  });
}
