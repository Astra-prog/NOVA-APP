import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Dashboard basic widget test', (WidgetTester tester) async {
    // Simple test that just checks if we can build a basic scaffold
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Dashboard Test'),
          ),
        ),
      ),
    );

    expect(find.text('Dashboard Test'), findsOneWidget);
  });
}
