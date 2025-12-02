import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nova/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: NovaApp()));

    // Wait for animations to settle (or timeout if infinite)
    // We use pump with a duration to advance time for animations
    await tester.pump(const Duration(seconds: 2));

    // Verify that we are on the login screen (or onboarding)
    // Checking for NOVA title
    expect(find.text('NOVA'), findsOneWidget);
  });
}
