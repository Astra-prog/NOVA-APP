import 'package:flutter/services.dart';

/// Utility class for haptic feedback
class HapticFeedbackUtil {
  /// Light impact feedback
  static Future<void> lightImpact() async {
    await HapticFeedback.lightImpact();
  }

  /// Medium impact feedback
  static Future<void> mediumImpact() async {
    await HapticFeedback.mediumImpact();
  }

  /// Heavy impact feedback
  static Future<void> heavyImpact() async {
    await HapticFeedback.heavyImpact();
  }

  /// Selection click feedback
  static Future<void> selectionClick() async {
    await HapticFeedback.selectionClick();
  }

  /// Vibrate feedback
  static Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }
}
