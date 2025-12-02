import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/app_state_provider.dart';

import '../../presentation/home/home_screen.dart';
import '../../presentation/map/map_screen.dart';
import '../../presentation/onboarding/onboarding_screen.dart';
import '../../presentation/regions/region_overview_screen.dart';
import '../../presentation/settings/settings_screen.dart';
import '../../presentation/stations/station_detail_screen.dart';
import '../../presentation/stations/station_list_screen.dart';
import '../../presentation/auth/login_screen.dart';

part 'app_router.g.dart';

@riverpod
Future<String> initialRoute(Ref ref) async {
  final appState = ref.read(appStateProvider.notifier);
  final isAuth =
      (await SharedPreferences.getInstance()).getBool('is_authenticated') ??
          false;
  final isOnboardingCompleted = await appState.isOnboardingCompleted();

  if (!isOnboardingCompleted) return '/';
  if (!isAuth) return '/login';
  return '/home';
}

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 0.1);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
        ),
      ),
      GoRoute(
        path: '/map',
        builder: (context, state) => const MapScreen(),
      ),
      GoRoute(
        path: '/stations',
        builder: (context, state) => const StationListScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return StationDetailScreen(stationId: id);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/regions',
        builder: (context, state) => const RegionOverviewScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
