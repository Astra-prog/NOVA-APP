# Antigravity - Groundwater Intelligence App

A production-ready Flutter application for real-time groundwater monitoring and analysis using DWLR (Digital Water Level Recorder) station data across India.

## 🌟 Features

### Implemented MVP Features
- ✅ **Role-Based Onboarding** - Select user role (Researcher/Planner/Policymaker)
- ✅ **Home Dashboard** - Key metrics, trends, and quick navigation
- ✅ **Interactive Map** - Google Maps with color-coded station markers
- ✅ **Station Management** - Searchable list with filters (state, district, status)
- ✅ **Detailed Analytics** - Station details with time-series charts (6-month trends)
- ✅ **Regional Overview** - State/District aggregated statistics with pie charts
- ✅ **Settings** - Role management and app configuration

## 🏗️ Architecture

### Clean Architecture (3-Layer)
```
lib/
├── core/           # Configuration, theme, routing, network
├── domain/         # Entities, repository interfaces, use cases
├── data/           # DTOs, data sources (remote/local), repository implementations
└── presentation/   # UI screens, controllers, widgets
```

### Tech Stack
- **Framework**: Flutter 3.x with null safety
- **State Management**: Riverpod (riverpod_annotation)
- **Navigation**: GoRouter
- **Networking**: Dio with interceptors
- **Data Serialization**: Freezed + JSON Serializable
- **Maps**: Google Maps Flutter
- **Charts**: FL Chart
- **Local Storage**: SharedPreferences, SQLite ready
- **Functional Programming**: FPDart (Either for error handling)

## 📦 Project Structure

```
antigravity/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── app.dart                     # MaterialApp configuration
│   ├── core/
│   │   ├── config/                  # App configuration
│   │   ├── errors/                  # Failure types
│   │   ├── network/                 # Dio provider
│   │   ├── routing/                 # GoRouter setup
│   │   └── theme/                   # Material 3 themes
│   ├── domain/
│   │   ├── entities/                # Station, WaterLevelPoint, RegionSummary
│   │   ├── repositories/            # Repository interfaces
│   │   └── usecases/                # GetStations, GetStationDetail, etc.
│   ├── data/
│   │   ├── models/                  # DTOs with JSON serialization
│   │   ├── datasources/
│   │   │   ├── remote/              # API data sources (Mock implemented)
│   │   │   └── local/               # Local cache (ready for implementation)
│   │   └── repositories/            # Repository implementations
│   └── presentation/
│       ├── common/                  # Shared widgets
│       ├── onboarding/              # Role selection
│       ├── home/                    # Dashboard
│       ├── map/                     # Google Maps view
│       ├── stations/                # List & detail screens
│       ├── regions/                 # Regional overview
│       └── settings/                # App settings
└── test/
    ├── smoke_test.dart              # App startup test
    └── unit_test.dart               # Repository tests
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.x or higher
- Dart SDK 3.2.0 or higher
- Android Studio / VS Code with Flutter extensions
- Google Maps API Key (for map functionality)

### Installation

1. **Install dependencies**
   ```bash
   cd antigravity
   flutter pub get
   ```

2. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Configure Google Maps API Key**
   
   **Android**: Add to `android/app/src/main/AndroidManifest.xml`
   ```xml
   <meta-data
       android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```
   
   **iOS**: Add to `ios/Runner/AppDelegate.swift`
   ```swift
   GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Testing

```bash
# Run all tests
flutter test

# Run specific test
flutter test test/smoke_test.dart

# Run with coverage
flutter test --coverage
```

## 🔧 Configuration

### API Integration
Update the API base URL in `lib/core/config/app_config.dart`:
```dart
static const String apiBaseUrl = 'https://your-api-domain.com/v1';
```

### Mock Data
Currently using mock data sources. To connect to real APIs:
1. Update `StationRemoteDataSource` in `lib/data/datasources/remote/station_remote_data_source.dart`
2. Implement actual Dio-based HTTP calls
3. Update `RegionRemoteDataSource` similarly

## 📊 Data Model

### Station Entity
```dart
- id: String
- name: String
- code: String
- latitude: double
- longitude: double
- state: String
- district: String
- basin: String?
- status: String (critical/warning/normal/above_normal)
- lastUpdatedAt: DateTime
- latestWaterLevel: double
```

### Region Summary
```dart
- regionType: String (State/District/Basin)
- regionName: String
- stationCount: int
- stationsOnline: int
- percentageCritical: double
- percentageWarning: double
- percentageNormal: double
- overallTrend: String
- narrativeSummary: String
```

## 🎨 Theming

- Material 3 Design System
- Light & Dark mode support
- Custom color scheme for status indicators:
  - Critical: Red (#D32F2F)
  - Warning: Amber (#FFA000)
  - Normal: Green (#388E3C)
  - Above Normal: Blue (#1976D2)

## 📱 Screens

1. **Onboarding** - `/`
2. **Home Dashboard** - `/home`
3. **Map View** - `/map`
4. **Station List** - `/stations`
5. **Station Detail** - `/stations/:id`
6. **Region Overview** - `/regions`
7. **Settings** - `/settings`

## 🔐 State Management

Using Riverpod with code generation:
- `@riverpod` annotation for providers
- Automatic provider generation via `build_runner`
- Family providers for parameterized data
- AsyncNotifier for state with side effects

## 🌐 Offline Support (Ready)

Infrastructure ready for offline-first architecture:
- `sqflite` dependency included
- Repository pattern supports dual data sources
- Local datasource folder structure created
- Implement caching strategy as needed

## 📈 Future Enhancements

- [ ] Real-time notifications for critical status changes
- [ ] Data export (CSV/Excel)
- [ ] Multi-language support (Hindi, regional languages)
- [ ] Advanced filtering and saved searches
- [ ] Predictive analytics using ML
- [ ] Admin dashboard for data management
- [ ] Offline-first with background sync

## 🐛 Known Issues

- Google Maps requires API key configuration
- Mock data currently used; connect to real API endpoints
- Some analyzer warnings for unused variables (non-critical)

## 📄 License

© 2025 Government of India  
This project is for official use in groundwater management initiatives.

## 👥 Contributors

Built as part of the Antigravity groundwater intelligence initiative.

## 📞 Support

For issues or questions:
1. Check existing issues
2. Review documentation
3. Contact the development team

---

**Version**: 1.0.0  
**Last Updated**: November 2025
