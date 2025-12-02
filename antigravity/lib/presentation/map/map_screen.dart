import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/utils/haptic_utils.dart';
import '../common/async_value_widget.dart';
import 'map_controller.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final Set<Marker> _markers = {};
  GoogleMapController? _mapController;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(20.5937, 78.9629), // Center of India
    zoom: 5,
  );

  @override
  Widget build(BuildContext context) {
    final stationsAsync = ref.watch(mapControllerProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Station Map'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
      body: AsyncValueWidget(
        value: stationsAsync,
        data: (stations) {
          _updateMarkers(stations);
          return Stack(
            children: [
              // Map Layer
              RepaintBoundary(
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  markers: _markers,
                  onMapCreated: (controller) {
                    _mapController = controller;
                    // If we have stations, fit bounds to show them all
                    if (stations.isNotEmpty) {
                      _fitBounds(stations);
                    }
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false, // Custom button below
                  zoomControlsEnabled: false, // Custom controls
                  mapToolbarEnabled: false,
                  style: _mapStyle, // Dark mode style
                ),
              ),
              // Custom Controls
              Positioned(
                right: 16,
                bottom: 100,
                child: RepaintBoundary(
                  child: Column(
                    children: [
                      FloatingActionButton.small(
                        heroTag: 'zoom_in',
                        onPressed: () {
                          _mapController?.animateCamera(CameraUpdate.zoomIn());
                          HapticUtils.selectionClick();
                        },
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        child: const Icon(Icons.add),
                      ).animate().scale(delay: 400.ms, duration: 300.ms),
                      const SizedBox(height: 8),
                      FloatingActionButton.small(
                        heroTag: 'zoom_out',
                        onPressed: () {
                          _mapController?.animateCamera(CameraUpdate.zoomOut());
                          HapticUtils.selectionClick();
                        },
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        child: const Icon(Icons.remove),
                      ).animate().scale(delay: 500.ms, duration: 300.ms),
                      const SizedBox(height: 16),
                      FloatingActionButton(
                        heroTag: 'my_location',
                        onPressed: () {
                          // In a real app, we'd request permission and get location
                          // For now, just reset to India view
                          _mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(_initialPosition));
                          HapticUtils.mediumImpact();
                        },
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: const Icon(Icons.my_location),
                      ).animate().scale(delay: 600.ms, duration: 300.ms),
                    ],
                  ),
                ),
              ),
              // Legend
              Positioned(
                left: 16,
                bottom: 32,
                child: RepaintBoundary(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Water Levels',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            _buildLegendItem(
                                'Normal', BitmapDescriptor.hueGreen),
                            const SizedBox(height: 4),
                            _buildLegendItem(
                                'Warning', BitmapDescriptor.hueOrange),
                            const SizedBox(height: 4),
                            _buildLegendItem(
                                'Critical', BitmapDescriptor.hueRed),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).animate().slideY(
                    begin: 1,
                    end: 0,
                    duration: 500.ms,
                    curve: Curves.easeOutBack),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLegendItem(String label, double hue) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.location_on,
            color: HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor(), size: 16),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black)),
      ],
    );
  }

  void _updateMarkers(List<dynamic> stations) {
    _markers.clear();
    for (final station in stations) {
      _markers.add(
        Marker(
          markerId: MarkerId(station.id),
          position: LatLng(station.latitude, station.longitude),
          infoWindow: InfoWindow(
            title: station.name,
            snippet:
                'Level: ${station.latestWaterLevel}m (${station.status.toUpperCase()})',
            onTap: () => context.push('/stations/${station.id}'),
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            _getHueForStatus(station.status),
          ),
        ),
      );
    }
  }

  void _fitBounds(List<dynamic> stations) {
    if (stations.isEmpty) return;
    double minLat = stations.first.latitude;
    double maxLat = stations.first.latitude;
    double minLng = stations.first.longitude;
    double maxLng = stations.first.longitude;

    for (final station in stations) {
      if (station.latitude < minLat) minLat = station.latitude;
      if (station.latitude > maxLat) maxLat = station.latitude;
      if (station.longitude < minLng) minLng = station.longitude;
      if (station.longitude > maxLng) maxLng = station.longitude;
    }

    _mapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat - 0.5, minLng - 0.5),
          northeast: LatLng(maxLat + 0.5, maxLng + 0.5),
        ),
        50, // padding
      ),
    );
  }

  double _getHueForStatus(String status) {
    switch (status.toLowerCase()) {
      case 'critical':
        return BitmapDescriptor.hueRed;
      case 'warning':
        return BitmapDescriptor.hueOrange;
      case 'normal':
        return BitmapDescriptor.hueGreen;
      case 'above_normal':
        return BitmapDescriptor.hueBlue;
      default:
        return BitmapDescriptor.hueAzure;
    }
  }

  // Dark Map Style JSON
  static const String _mapStyle = '''
[
  {
    "elementType": "geometry",
    "stylers": [{"color": "#212121"}]
  },
  {
    "elementType": "labels.icon",
    "stylers": [{"visibility": "off"}]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#757575"}]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [{"color": "#212121"}]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry",
    "stylers": [{"color": "#757575"}]
  },
  {
    "featureType": "administrative.country",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#9e9e9e"}]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#757575"}]
  },
  {
    "featureType": "road",
    "elementType": "geometry.fill",
    "stylers": [{"color": "#2c2c2c"}]
  },
  {
    "featureType": "road",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#8a8a8a"}]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [{"color": "#373737"}]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [{"color": "#3c3c3c"}]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [{"color": "#000000"}]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [{"color": "#3d3d3d"}]
  }
]
''';
}
