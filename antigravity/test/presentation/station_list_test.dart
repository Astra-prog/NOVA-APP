import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nova/presentation/stations/station_list_screen.dart';

void main() {
  testWidgets('Station List renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: StationListScreen(),
        ),
      ),
    );

    // Verify title
    expect(find.text('Stations'), findsOneWidget);

    // Verify search bar exists
    expect(find.byType(TextField), findsOneWidget);
  });
}
