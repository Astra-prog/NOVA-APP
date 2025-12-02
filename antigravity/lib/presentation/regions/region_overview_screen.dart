import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../common/async_value_widget.dart';
import 'region_overview_controller.dart';
import '../../core/theme/app_theme.dart';

class RegionOverviewScreen extends ConsumerStatefulWidget {
  const RegionOverviewScreen({super.key});

  @override
  ConsumerState<RegionOverviewScreen> createState() =>
      _RegionOverviewScreenState();
}

class _RegionOverviewScreenState extends ConsumerState<RegionOverviewScreen> {
  String _selectedRegionType = 'State';
  String _selectedRegionName = 'Delhi'; // Default

  @override
  Widget build(BuildContext context) {
    final summaryAsync = ref.watch(regionOverviewControllerProvider(
      regionType: _selectedRegionType,
      regionName: _selectedRegionName,
    ));

    return Scaffold(
      appBar: AppBar(title: const Text('Region Overview')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilters(),
            const SizedBox(height: 24),
            AsyncValueWidget(
              value: summaryAsync,
              data: (summary) => _buildContent(context, summary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              initialValue: _selectedRegionType,
              decoration: const InputDecoration(labelText: 'Region Type'),
              items: ['State', 'District', 'Basin']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedRegionType = value;
                    // Reset region name based on type (mock logic)
                    if (value == 'State') _selectedRegionName = 'Delhi';
                    if (value == 'District') _selectedRegionName = 'New Delhi';
                    if (value == 'Basin') _selectedRegionName = 'Ganga';
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _selectedRegionName,
              decoration: const InputDecoration(labelText: 'Region Name'),
              // Mock items based on type
              items: _getRegionNames(_selectedRegionType)
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedRegionName = value;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getRegionNames(String type) {
    if (type == 'State') {
      return ['Delhi', 'Maharashtra', 'Tamil Nadu', 'Karnataka'];
    }
    if (type == 'District') {
      return ['New Delhi', 'Mumbai', 'Chennai', 'Bangalore'];
    }
    return ['Ganga', 'Yamuna', 'Cauvery'];
  }

  Widget _buildContent(BuildContext context, dynamic summary) {
    // summary is RegionSummary
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary for ${summary.regionName}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                label: 'Total Stations',
                value: summary.stationCount.toString(),
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatCard(
                label: 'Online',
                value: summary.stationsOnline.toString(),
                color: AppTheme.normalColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Status Distribution',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: summary.percentageCritical,
                  color: AppTheme.criticalColor,
                  title: '${summary.percentageCritical}%',
                  radius: 50,
                  titleStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                PieChartSectionData(
                  value: summary.percentageWarning,
                  color: AppTheme.warningColor,
                  title: '${summary.percentageWarning}%',
                  radius: 50,
                  titleStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                PieChartSectionData(
                  value: summary.percentageNormal,
                  color: AppTheme.normalColor,
                  title: '${summary.percentageNormal}%',
                  radius: 50,
                  titleStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Analysis', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overall Trend: ${summary.overallTrend.toUpperCase()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(summary.narrativeSummary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatCard(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(value,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: color, fontWeight: FontWeight.bold)),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
