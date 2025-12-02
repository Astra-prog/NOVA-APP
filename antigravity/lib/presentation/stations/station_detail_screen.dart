import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/async_value_widget.dart';
import 'station_detail_controller.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/entities/water_level_point.dart';
import 'package:intl/intl.dart';

class StationDetailScreen extends ConsumerWidget {
  final String stationId;

  const StationDetailScreen({super.key, required this.stationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stationAsync = ref.watch(stationDetailControllerProvider(stationId));
    final timeSeriesAsync = ref.watch(stationTimeSeriesProvider(stationId));

    return Scaffold(
      appBar: AppBar(title: const Text('Station Details')),
      body: AsyncValueWidget(
        value: stationAsync,
        data: (station) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(station.name,
                                style: Theme.of(context).textTheme.titleLarge),
                            Chip(
                              label: Text(station.status.toUpperCase()),
                              backgroundColor:
                                  _getColorForStatus(station.status)
                                      .withValues(alpha: 0.2),
                              labelStyle: TextStyle(
                                  color: _getColorForStatus(station.status)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Code: ${station.code}'),
                        Text('Location: ${station.district}, ${station.state}'),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Latest Water Level',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                Text(
                                  '${station.latestWaterLevel} m',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Last Updated',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                Text(
                                  DateFormat.yMMMd()
                                      .add_jm()
                                      .format(station.lastUpdatedAt),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text('Water Level Trend (Last 6 Months)',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: AsyncValueWidget(
                    value: timeSeriesAsync,
                    data: (points) => _buildChart(context, points),
                  ),
                ),
                const SizedBox(height: 24),
                Text('Analysis',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Over the last 6 months, groundwater levels at this station have generally been decreasing, with particularly sharp declines in June and July. This indicates a high stress on the aquifer.',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChart(BuildContext context, List<WaterLevelPoint> points) {
    if (points.isEmpty) return const Center(child: Text('No data available'));

    // Sort points by date
    points.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < points.length) {
                  // Show date for every 5th point to avoid clutter
                  if (value.toInt() % (points.length ~/ 5) == 0) {
                    final date = points[value.toInt()].timestamp;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        DateFormat.MMM().format(date),
                        style: const TextStyle(fontSize: 10),
                      ),
                    );
                  }
                }
                return const SizedBox.shrink();
              },
              interval: 1,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: points.asMap().entries.map((e) {
              return FlSpot(e.key.toDouble(), e.value.waterLevel);
            }).toList(),
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
                show: true, color: Colors.blue.withValues(alpha: 0.1)),
          ),
        ],
      ),
    );
  }

  Color _getColorForStatus(String status) {
    switch (status.toLowerCase()) {
      case 'critical':
        return AppTheme.criticalColor;
      case 'warning':
        return AppTheme.warningColor;
      case 'normal':
        return AppTheme.normalColor;
      case 'above_normal':
        return AppTheme.aboveNormalColor;
      default:
        return Colors.grey;
    }
  }
}
