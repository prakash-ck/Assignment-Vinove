import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'as gMap;
import '../models/attendance_model.dart';
// import 'package:latlong2/latlong.dart';


class LocationScreen extends StatelessWidget {
  final Member member;

  LocationScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${member.name} Location'),
      ),
      body: Column(
        children: [
          // Expanded(child: FlutterMap(
          //   options: MapOptions(
          //     initialCenter: LatLng(51.509364, -0.128928),
          //     initialZoom: 9.2,
          //   ),
          //   children: [
          //     TileLayer(
          //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
          //       userAgentPackageName: 'com.example.app',
          //       // And many more recommended properties!
          //     ),
          //     RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
          //       attributions: [
          //         TextSourceAttribution(
          //           'OpenStreetMap contributors',
          //           // onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
          //         ),
          //         // Also add images...
          //       ],
          //     ),
          //   ],
          // )),
          // Expanded(
          //   child: GoogleMap(
          //     initialCameraPosition: CameraPosition(
          //       target: LatLng(
          //         member.currentLocation.lat,
          //         member.currentLocation.lng,
          //       ),
          //       zoom: 14,
          //     ),
          //     markers: {
          //       Marker(
          //         markerId: MarkerId('currentLocation'),
          //         position: LatLng(
          //           member.currentLocation.lat,
          //           member.currentLocation.lng,
          //         ),
          //       ),
          //     },
          //   ),
          // ),
          // Visited locations in timeline view
          Expanded(
            child: ListView.builder(
              itemCount: member.timeline[0].visitedLocations.length,
              itemBuilder: (context, index) {
                var location = member.timeline[0].visitedLocations[index];
                return ListTile(
                  title: Text('Visited at ${location.timestamp}'),
                  subtitle: Text(
                    'Lat: ${location.lat}, Lng: ${location.lng}, Duration: ${location.duration} mins',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
