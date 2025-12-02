import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nova/core/theme/app_theme.dart';
import 'package:nova/core/theme/theme_provider.dart';

void main() {
  group('ThemeNotifier', () {
    late ProviderContainer container;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is default (nova theme, light mode)', () {
      final state = container.read(themeNotifierProvider);
      expect(state.themeType, AppThemeType.nova);
      expect(state.isDarkMode, false);
    });

    test('toggleDarkMode switches between light and dark mode', () async {
      final notifier = container.read(themeNotifierProvider.notifier);

      // Initial state is light
      expect(container.read(themeNotifierProvider).isDarkMode, false);

      // Toggle to dark
      await notifier.toggleDarkMode();
      expect(container.read(themeNotifierProvider).isDarkMode, true);

      // Toggle back to light
      await notifier.toggleDarkMode();
      expect(container.read(themeNotifierProvider).isDarkMode, false);
    });

    test('setThemeType updates the theme', () async {
      final notifier = container.read(themeNotifierProvider.notifier);

      // Initial state is nova
      expect(
          container.read(themeNotifierProvider).themeType, AppThemeType.nova);

      // Change to oceanBlue
      await notifier.setThemeType(AppThemeType.oceanBlue);
      expect(container.read(themeNotifierProvider).themeType,
          AppThemeType.oceanBlue);

      // Change to forestGreen
      await notifier.setThemeType(AppThemeType.forestGreen);
      expect(container.read(themeNotifierProvider).themeType,
          AppThemeType.forestGreen);
    });
  });
}
