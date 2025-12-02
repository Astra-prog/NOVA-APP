import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/haptic_utils.dart';
import '../home_controller.dart';
import '../../common/async_value_widget.dart';
import '../../common/widgets/custom_card.dart';

class DashboardTab extends ConsumerWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(homeControllerProvider);
    return RefreshIndicator(
      onRefresh: () => ref.read(homeControllerProvider.notifier).refresh(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppTheme.spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Groundwater Overview',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppTheme.spacingM),
            AsyncValueWidget(
              value: summaryAsync,
              data: (summary) => _buildSummaryCards(context, summary),
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppTheme.spacingM),
            _buildQuickActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards(BuildContext context, dynamic summary) {
    return RepaintBoundary(
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              _MetricCard(
                title: 'Total Stations',
                value: summary.stationCount.toString(),
                icon: Icons.sensors,
                color: Colors.blue,
                gradient: true,
              ).animate().shimmer(duration: 1200.ms, delay: 400.ms),
              const SizedBox(height: AppTheme.spacingM),
              const Row(
                children: [
                  Expanded(
                    child: _MetricCard(
                      title: 'Online',
                      value: '\${summary.stationsOnline}',
                      subtitle:
                          '\${((summary.stationsOnline / summary.stationCount) * 100).toStringAsFixed(1)}%',
                      icon: Icons.wifi,
                      color: AppTheme.normalColor,
                    ),
                  ),
                  SizedBox(width: AppTheme.spacingM),
                  Expanded(
                    child: _MetricCard(
                      title: 'Critical',
                      value: '\${summary.percentageCritical}%',
                      icon: Icons.warning_amber,
                      color: AppTheme.criticalColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingM),
              RepaintBoundary(
                child: CustomCard(
                  type: CustomCardType.glassmorphic,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: AppTheme.spacingS),
                          const Text(
                            'National Trend',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.spacingM),
                      Text(
                        summary.overallTrend.toUpperCase(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: summary.overallTrend == 'stable'
                              ? AppTheme.normalColor
                              : (summary.overallTrend == 'decreasing'
                                  ? AppTheme.criticalColor
                                  : Colors.blue),
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingS),
                      Text(
                        summary.narrativeSummary,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppTheme.spacingM,
      crossAxisSpacing: AppTheme.spacingM,
      childAspectRatio: 1.3,
      children: [
        _ActionTile(
          title: 'Map View',
          icon: Icons.map,
          color: Colors.deepPurple,
          onTap: () => context.push('/map'),
        ),
        _ActionTile(
          title: 'Stations',
          icon: Icons.list_alt,
          color: Colors.orange,
          onTap: () => context.push('/stations'),
        ),
        _ActionTile(
          title: 'Regions',
          icon: Icons.pie_chart,
          color: Colors.green,
          onTap: () => context.push('/regions'),
        ),
        _ActionTile(
          title: 'Settings',
          icon: Icons.settings,
          color: Colors.blue,
          onTap: () => context.push('/settings'),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final bool gradient;

  const _MetricCard({
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    required this.color,
    this.gradient = false,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      decoration: gradient
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            )
          : null,
      child: Card(
        elevation: gradient ? 0 : AppTheme.elevationLow,
        color: gradient ? Colors.transparent : null,
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: gradient ? Colors.white : color,
                size: 32,
              ),
              const SizedBox(height: AppTheme.spacingS),
              Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: gradient ? Colors.white : null,
                    ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: gradient
                            ? Colors.white.withValues(alpha: 0.9)
                            : null,
                      ),
                ),
              ],
              const SizedBox(height: AppTheme.spacingXS),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:
                          gradient ? Colors.white.withValues(alpha: 0.9) : null,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
    return card;
  }
}

class _ActionTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ActionTile({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<_ActionTile> createState() => _ActionTileState();
}

class _ActionTileState extends State<_ActionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: CustomCard(
        onTap: () {
          _controller.forward().then((_) => _controller.reverse());
          HapticUtils.lightImpact();
          widget.onTap();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, size: 32, color: widget.color),
            const SizedBox(height: AppTheme.spacingS),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ).animate().scale(delay: 200.ms, duration: 300.ms),
    );
  }
}
