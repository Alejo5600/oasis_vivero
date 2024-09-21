import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(37.7749, -122.4194), // Coordenadas de San Francisco
          initialZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
            userAgentPackageName: 'com.example.app',
            maxNativeZoom: 19, // Scale tiles when the server doesn't support higher zoom levels
            // And many more recommended properties!
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: LatLng(37.7749, -122.4194),
                color: Colors.blue.withOpacity(0.5), // Color del círculo
              borderStrokeWidth: 2, // Ancho del borde
              borderColor: Colors.blue, // Color del borde
              radius: 30, // Radio del círculo en píxeles
              ),
            ],
          ),
        ],
      ),
    );
  }
}
