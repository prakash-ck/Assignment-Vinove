import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/attendance_model.dart';

class RouteDetailsScreen extends StatelessWidget {
  final Member member;

  RouteDetailsScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    List<VisitedLocation> visitedLocations = member.timeline[0].visitedLocations;

    List<LatLng> polylinePoints = visitedLocations.map((location) {
      return LatLng(location.lat, location.lng);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${member.name} Route Details'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Start Location: Lat: ${visitedLocations[0].lat}, Lng: ${visitedLocations[0].lng}'),
                Text('Stop Location: Lat: ${visitedLocations.last.lat}, Lng: ${visitedLocations.last.lng}'),
                Text('Total KMs: ...'),
                Text('Total Duration: ...'),
              ],
            ),
          ),
          // Google Map showing the route
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  visitedLocations[0].lat,
                  visitedLocations[0].lng,
                ),
                zoom: 12,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId('route'),
                  points: polylinePoints,
                  color: Colors.blue,
                  width: 5,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
