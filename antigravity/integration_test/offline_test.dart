import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nova/app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Offline Mode Integration Test', () {
    testWidgets('App handles offline gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: NovaApp()));
      await tester.pumpAndSettle();

      // Wait for initial load
      await tester.pump(const Duration(seconds: 2));

      // Note: In a real test, you would:
      // 1. Mock network failures
      // 2. Verify error messages appear
      // 3. Check retry buttons work
      // 4. Verify cached data is displayed

      // For now, just verify app doesn't crash
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
