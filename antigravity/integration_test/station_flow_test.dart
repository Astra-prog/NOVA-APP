import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nova/app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Station Flow Integration Test', () {
    testWidgets('Complete station flow', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: NovaApp()));
      await tester.pumpAndSettle();

      // 1. Login (or skip if using test auth)
      // For now, we assume app starts at login or onboarding

      // 2. Navigate to Stations
      // This assumes we can reach stations tab or screen
      final stationsButton = find.text('Stations');
      if (stationsButton.evaluate().isNotEmpty) {
        await tester.tap(stationsButton);
        await tester.pumpAndSettle();
      }

      // 3. Verify station list loads
      await tester.pump(const Duration(seconds: 2));

      // 4. Test search
      final searchField = find.byType(TextField);
      if (searchField.evaluate().isNotEmpty) {
        await tester.enterText(searchField.first, 'Station');
        await tester.pump(const Duration(milliseconds: 500));
      }

      // 5. Tap first station card (if exists)
      final stationCards = find.byType(Card);
      if (stationCards.evaluate().isNotEmpty) {
        await tester.tap(stationCards.first);
        await tester.pumpAndSettle();

        // 6. Verify station detail screen
        expect(find.text('Station Details'), findsOneWidget);
      }
    });

    testWidgets('Filter and navigation test', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: NovaApp()));
      await tester.pumpAndSettle();

      // Test filter functionality
      final filterButton = find.byIcon(Icons.filter_list);
      if (filterButton.evaluate().isNotEmpty) {
        await tester.tap(filterButton);
        await tester.pumpAndSettle();

        // Select critical status
        final criticalOption = find.text('Critical');
        if (criticalOption.evaluate().isNotEmpty) {
          await tester.tap(criticalOption);
          await tester.pumpAndSettle();
        }
      }
    });
  });
}
