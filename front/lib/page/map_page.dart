import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(47.218371, -1.553621),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).go('/map/fiche');
          },
          child: const Text('🌱', style: TextStyle(fontSize: 40)),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            GoRouter.of(context).go('/');
          },
        ),
        title: const Text('Arosa-Je'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              center: LatLng(47.218371, -1.553621),
              zoom: 13.0,
            ),
            nonRotatedChildren: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(markers: markers),
            ],
            children: [],
          ),
          Positioned(
            top: 20.0, // Ajoutez une marge pour ne pas chevaucher l'AppBar
            left: 20.0,
            child: FloatingActionButton(
              onPressed: () {
                GoRouter.of(context).go('/chat');
              },
              child: Icon(Icons.chat),
              backgroundColor: Colors.green[700],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/registration');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Créer une demande de garde'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/conseil');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    foregroundColor: Colors.white,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Demander conseil'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
