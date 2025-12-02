import 'package:flutter/services.dart';
import 'dart:io';

/// Centralized utility class for haptic feedback
/// Provides consistent tactile responses across the app
class HapticUtils {
  /// Light impact feedback (for subtle interactions)
  /// Examples: Button press acknowledgment, toggle switch
  static Future<void> lightImpact() async {
    if (Platform.isIOS || Platform.isAndroid) {
      await HapticFeedback.lightImpact();
    }
  }

  /// Medium impact feedback (for standard interactions)
  /// Examples: Selection changes, page swipes
  static Future<void> mediumImpact() async {
    if (Platform.isIOS || Platform.isAndroid) {
      await HapticFeedback.mediumImpact();
    }
  }

  /// Heavy impact feedback (for significant actions)
  /// Examples: Delete actions, important confirmations
  static Future<void> heavyImpact() async {
    if (Platform.isIOS || Platform.isAndroid) {
      await HapticFeedback.heavyImpact();
    }
  }

  /// Selection click feedback (for picker interactions)
  /// Examples: Scrolling through lists, picker changes
  static Future<void> selectionClick() async {
    await HapticFeedback.selectionClick();
  }

  /// Vibrate feedback (for critical actions or errors)
  /// Examples: Errors, warnings, notifications
  static Future<void> vibrate() async {
    if (Platform.isIOS || Platform.isAndroid) {
      await HapticFeedback.vibrate();
    }
  }

  /// Success feedback (iOS only - soft haptic)
  /// Fallback to light impact on Android
  static Future<void> success() async {
    if (Platform.isIOS) {
      // iOS uses notification feedback
      await HapticFeedback.lightImpact();
    } else {
      await lightImpact();
    }
  }

  /// Warning feedback (iOS only - moderate haptic)
  /// Fallback to medium impact on Android
  static Future<void> warning() async {
    if (Platform.isIOS) {
      await HapticFeedback.mediumImpact();
    } else {
      await mediumImpact();
    }
  }

  /// Error feedback (iOS only - strong haptic)
  /// Fallback to heavy impact on Android
  static Future<void> error() async {
    if (Platform.isIOS) {
      await HapticFeedback.heavyImpact();
    } else {
      await heavyImpact();
    }
  }
}
