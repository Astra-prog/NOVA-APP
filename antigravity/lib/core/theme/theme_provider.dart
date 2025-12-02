import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

part 'theme_provider.g.dart';

/// Theme state holding current theme type and dark mode preference
class ThemeState {
  final AppThemeType themeType;
  final bool isDarkMode;

  const ThemeState({
    this.themeType = AppThemeType.nova,
    this.isDarkMode = false,
  });

  ThemeState copyWith({
    AppThemeType? themeType,
    bool? isDarkMode,
  }) {
    return ThemeState(
      themeType: themeType ?? this.themeType,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}

/// Theme notifier for managing theme state
@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  static const String _themeTypeKey = 'theme_type';
  static const String _darkModeKey = 'dark_mode';

  @override
  ThemeState build() {
    _loadTheme();
    return const ThemeState(
      themeType: AppThemeType.nova,
      isDarkMode: false,
    );
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeTypeKey) ?? 0;
    final isDark = prefs.getBool(_darkModeKey) ?? false;

    state = ThemeState(
      themeType: AppThemeType.values[themeIndex],
      isDarkMode: isDark,
    );
  }

  Future<void> setThemeType(AppThemeType type) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeTypeKey, type.index);
    state = state.copyWith(themeType: type);
  }

  Future<void> toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    final newValue = !state.isDarkMode;
    await prefs.setBool(_darkModeKey, newValue);
    state = state.copyWith(isDarkMode: newValue);
  }

  Future<void> setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, value);
    state = state.copyWith(isDarkMode: value);
  }
}
