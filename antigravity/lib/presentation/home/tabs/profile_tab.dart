import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/login_controller.dart';
import '../../common/widgets/custom_card.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        children: [
          // Profile Card
          FutureBuilder<Map<String, String?>>(
            future: ref.read(loginControllerProvider.notifier).getUserInfo(),
            builder: (context, snapshot) {
              final email = snapshot.data?['email'] ?? 'user@example.com';
              final name = snapshot.data?['name'] ?? 'User';

              return CustomCard(
                type: CustomCardType.gradient,
                gradientColors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Text(
                        name[0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppTheme.spacingM),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 24,
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
              );
            },
          )
              .animate()
              .slideY(
                  begin: -0.5,
                  end: 0,
                  duration: 600.ms,
                  curve: Curves.easeOutBack)
              .fadeIn(),
          const SizedBox(height: AppTheme.spacingL),

          // Statistics
          Text(
            'Your Statistics',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: AppTheme.spacingM),

          const Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.visibility,
                  label: 'Views',
                  value: '1,234',
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _StatCard(
                  icon: Icons.bookmark,
                  label: 'Saved',
                  value: '45',
                  color: Colors.green,
                ),
              ),
            ],
          )
              .animate()
              .slideX(begin: -0.2, end: 0, delay: 300.ms, duration: 500.ms)
              .fadeIn(),
          const SizedBox(height: AppTheme.spacingM),

          const Row(
            children: [
              Expanded(
                child: _StatCard(
                  icon: Icons.share,
                  label: 'Shared',
                  value: '78',
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: AppTheme.spacingM),
              Expanded(
                child: _StatCard(
                  icon: Icons.star,
                  label: 'Favorites',
                  value: '23',
                  color: Colors.amber,
                ),
              ),
            ],
          )
              .animate()
              .slideX(begin: 0.2, end: 0, delay: 400.ms, duration: 500.ms)
              .fadeIn(),
          const SizedBox(height: AppTheme.spacingL),

          // Recent Activity
          Text(
            'Recent Activity',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ).animate().fadeIn(delay: 500.ms),
          const SizedBox(height: AppTheme.spacingM),

          const CustomCard(
            child: Column(
              children: [
                _ActivityItem(
                  icon: Icons.map,
                  title: 'Viewed Map',
                  subtitle: '2 hours ago',
                  color: Colors.teal,
                ),
                Divider(),
                _ActivityItem(
                  icon: Icons.sensors,
                  title: 'Checked Station Data',
                  subtitle: '5 hours ago',
                  color: Colors.indigo,
                ),
                Divider(),
                _ActivityItem(
                  icon: Icons.download,
                  title: 'Downloaded Report',
                  subtitle: 'Yesterday',
                  color: Colors.green,
                ),
              ],
            ),
          ).animate().scale(delay: 600.ms, duration: 500.ms).fadeIn(),
          const SizedBox(height: AppTheme.spacingL),

          // Quick Settings
          CustomCard(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Edit profile coming soon')),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push('/settings');
                  },
                ),
              ],
            ),
          )
              .animate()
              .slideY(begin: 0.5, end: 0, delay: 700.ms, duration: 500.ms)
              .fadeIn(),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(AppTheme.spacingM),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: AppTheme.spacingS),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(AppTheme.spacingS),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      contentPadding: EdgeInsets.zero,
    );
  }
}
