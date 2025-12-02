import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nova/app.dart';

void main() {
  testWidgets('Login screen renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: NovaApp()));

    // Allow animations to run
    await tester.pump(const Duration(seconds: 2));

    // Verify that the login screen is displayed
    expect(find.text('NOVA'), findsOneWidget);
    expect(find.byType(TextFormField),
        findsNWidgets(2)); // Email and Password fields
    expect(find.byType(ElevatedButton), findsOneWidget); // Login button
  });
}
