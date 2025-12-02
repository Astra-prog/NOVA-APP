import 'package:flutter/material.dart';

/// Theme identifier enum
enum AppThemeType {
  nova, // New default theme
  oceanBlue,
  forestGreen,
  sunsetOrange,
  purpleNight,
}

class AppTheme {
  // Status Colors (consistent across all themes)
  static const Color criticalColor = Color(0xFFF43F5E); // Rose 500
  static const Color warningColor = Color(0xFFF59E0B); // Amber 500
  static const Color normalColor = Color(0xFF10B981); // Emerald 500
  static const Color aboveNormalColor = Color(0xFF3B82F6); // Blue 500

  // Design tokens
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXL = 24.0;

  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;

  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // Animation durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Theme color schemes with modern, vibrant colors
  static const Map<AppThemeType, Map<String, Color>> _themeColors = {
    AppThemeType.nova: {
      'primary': Color(0xFF1E3A8A), // Deep Blue
      'primaryLight': Color(0xFF3B82F6), // Vibrant Blue
      'secondary': Color(0xFF0D9488), // Teal
      'secondaryLight': Color(0xFF06B6D4), // Cyan
      'accent': Color(0xFF7C3AED), // Purple
    },
    AppThemeType.oceanBlue: {
      'primary': Color(0xFF0D47A1),
      'primaryLight': Color(0xFF42A5F5),
      'secondary': Color(0xFF00ACC1),
      'secondaryLight': Color(0xFF00E5FF),
      'accent': Color(0xFF00BCD4),
    },
    AppThemeType.forestGreen: {
      'primary': Color(0xFF1B5E20),
      'primaryLight': Color(0xFF66BB6A),
      'secondary': Color(0xFF2E7D32),
      'secondaryLight': Color(0xFF76FF03),
      'accent': Color(0xFF4CAF50),
    },
    AppThemeType.sunsetOrange: {
      'primary': Color(0xFFE65100),
      'primaryLight': Color(0xFFFF9800),
      'secondary': Color(0xFFF57C00),
      'secondaryLight': Color(0xFFFFD54F),
      'accent': Color(0xFFFF6F00),
    },
    AppThemeType.purpleNight: {
      'primary': Color(0xFF4A148C),
      'primaryLight': Color(0xFF9C27B0),
      'secondary': Color(0xFF6A1B9A),
      'secondaryLight': Color(0xFFE1BEE7),
      'accent': Color(0xFF7B1FA2),
    },
  };

  static ThemeData getTheme(AppThemeType themeType, bool isDark) {
    final colors = _themeColors[themeType]!;
    final brightness = isDark ? Brightness.dark : Brightness.light;

    final colorScheme = ColorScheme.fromSeed(
      seedColor: colors['primary']!,
      brightness: brightness,
      primary: colors['primary']!,
      secondary: colors['secondary']!,
      error: criticalColor,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: brightness,

      // Typography with improved readability
      textTheme: _getTextTheme(isDark),

      // AppBar Theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: isDark ? Colors.white : colors['primary'],
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
          color: isDark ? Colors.white : colors['primary'],
        ),
      ),

      // Card Theme with enhanced shadows
      cardTheme: CardThemeData(
        elevation: elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
        ),
        clipBehavior: Clip.antiAlias,
        shadowColor: colors['primary']!.withValues(alpha: 0.1),
      ),

      // Elevated Button Theme with gradients
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: elevationLow,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingM,
            vertical: spacingS,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusSmall),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.25,
          ),
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.black.withValues(alpha: 0.03),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide(
            color: colors['primary']!,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingM,
          vertical: spacingM,
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: colors['primary'],
        unselectedItemColor: isDark ? Colors.white54 : Colors.black54,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: elevationMedium,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),

      // Drawer Theme
      drawerTheme: const DrawerThemeData(
        elevation: elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radiusLarge),
            bottomRight: Radius.circular(radiusLarge),
          ),
        ),
      ),

      // Floating Action Button Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: elevationMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLarge),
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.black.withValues(alpha: 0.05),
        labelStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontSize: 14,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: spacingM,
          vertical: spacingS,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
        ),
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: isDark
            ? Colors.white.withValues(alpha: 0.1)
            : Colors.black.withValues(alpha: 0.1),
        thickness: 1,
        space: spacingM,
      ),
    );
  }

  static TextTheme _getTextTheme(bool isDark) {
    final baseColor = isDark ? Colors.white : Colors.black87;

    return TextTheme(
      // Display styles
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        height: 1.12,
        color: baseColor,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.16,
        color: baseColor,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.22,
        color: baseColor,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.25,
        color: baseColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.29,
        color: baseColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.33,
        color: baseColor,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1.27,
        color: baseColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        height: 1.5,
        color: baseColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
        color: baseColor,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.5,
        color: baseColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        height: 1.43,
        color: baseColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        height: 1.33,
        color: baseColor.withValues(alpha: 0.8),
      ),

      // Label styles
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 1.43,
        color: baseColor,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.33,
        color: baseColor,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        height: 1.45,
        color: baseColor.withValues(alpha: 0.8),
      ),
    );
  }

  // Gradient definitions for enhanced visuals
  static LinearGradient getPrimaryGradient(AppThemeType themeType) {
    final colors = _themeColors[themeType]!;
    return LinearGradient(
      colors: [
        colors['primary']!,
        colors['primaryLight']!,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static LinearGradient getSecondaryGradient(AppThemeType themeType) {
    final colors = _themeColors[themeType]!;
    return LinearGradient(
      colors: [
        colors['secondary']!,
        colors['secondaryLight']!,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  // Helper methods for settings screen
  static Color getPrimaryColor(AppThemeType themeType) {
    return _themeColors[themeType]!['primary']!;
  }

  static String getThemeName(AppThemeType themeType) {
    switch (themeType) {
      case AppThemeType.nova:
        return 'NOVA';
      case AppThemeType.oceanBlue:
        return 'Ocean Blue';
      case AppThemeType.forestGreen:
        return 'Forest Green';
      case AppThemeType.sunsetOrange:
        return 'Sunset Orange';
      case AppThemeType.purpleNight:
        return 'Purple Night';
    }
  }
}
