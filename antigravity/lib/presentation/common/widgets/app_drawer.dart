import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/login_controller.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/theme_provider.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentRoute = GoRouterState.of(context).uri.path;

    return Drawer(
      child: Column(
        children: [
          // Gradient Header
          _buildDrawerHeader(context, ref, theme),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildNavItem(
                  context: context,
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  route: '/home',
                  currentRoute: currentRoute,
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.map,
                  title: 'Map View',
                  route: '/map',
                  currentRoute: currentRoute,
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.sensors,
                  title: 'Stations',
                  route: '/stations',
                  currentRoute: currentRoute,
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.pie_chart,
                  title: 'Regions',
                  route: '/regions',
                  currentRoute: currentRoute,
                ),
                const Divider(),
                _buildNavItem(
                  context: context,
                  icon: Icons.settings,
                  title: 'Settings',
                  route: '/settings',
                  currentRoute: currentRoute,
                ),
                _buildNavItem(
                  context: context,
                  icon: Icons.info_outline,
                  title: 'About',
                  route: '/about',
                  currentRoute: currentRoute,
                  onTap: () {
                    Navigator.pop(context);
                    showAboutDialog(
                      context: context,
                      applicationName: 'NOVA',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© 2025 Government of India',
                      children: [
                        const Text(
                            'Real-time groundwater intelligence and decision-support app.'),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          // Theme Switcher Section
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: _buildThemeSwitcher(context, ref, theme),
          ),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingM),
            child: OutlinedButton.icon(
              onPressed: () async {
                await ref.read(loginControllerProvider.notifier).logout();
                if (context.mounted) {
                  context.go('/login');
                }
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.criticalColor,
                side: const BorderSide(color: AppTheme.criticalColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(
      BuildContext context, WidgetRef ref, ThemeData theme) {
    return FutureBuilder<Map<String, String?>>(
      future: ref.read(loginControllerProvider.notifier).getUserInfo(),
      builder: (context, snapshot) {
        final email = snapshot.data?['email'] ?? 'user@example.com';
        final name = snapshot.data?['name'] ?? 'User';

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Text(
                      name[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingM),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingXS),
                  Text(
                    email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String route,
    required String currentRoute,
    VoidCallback? onTap,
    int? badge,
  }) {
    final isActive = currentRoute == route;
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? theme.colorScheme.primary : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? theme.colorScheme.primary : null,
        ),
      ),
      trailing: badge != null
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingS,
                vertical: AppTheme.spacingXS,
              ),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
              ),
              child: Text(
                badge.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
      selected: isActive,
      selectedTileColor: theme.colorScheme.primary.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
      ),
      onTap: onTap ??
          () {
            Navigator.pop(context);
            context.go(route);
          },
    );
  }

  Widget _buildThemeSwitcher(
      BuildContext context, WidgetRef ref, ThemeData theme) {
    final themeState = ref.watch(themeNotifierProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Theme',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppTheme.spacingS),
        SwitchListTile(
          value: themeState.isDarkMode,
          onChanged: (value) {
            ref.read(themeNotifierProvider.notifier).toggleDarkMode();
          },
          title: const Text('Dark Mode'),
          contentPadding: EdgeInsets.zero,
          dense: true,
        ),
      ],
    );
  }
}
