class AppConfig {
  static const String appName = 'NOVA';
  static const String apiBaseUrl =
      'https://api.antigravity.gov.in/v1'; // Placeholder

  // Timeouts
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;

  // Pagination
  static const int defaultPageSize = 20;

  // Feature Flags
  static const bool enableLogging = true;
}
