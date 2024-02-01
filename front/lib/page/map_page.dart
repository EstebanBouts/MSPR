import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/widgets.dart';


class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Liste des marqueurs
    List<Marker> markers = [
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(47.218371, -1.553621),
        child: GestureDetector(
          onTap: () {
            context.go('/map/fiche'); // Utilisation de GoRouter pour la navigation
          },
          child: const Text('🌱', style: TextStyle(fontSize: 40)),
        ),
      ),
      // Ajoutez plus de marqueurs ici si nécessaire
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Flutter Map')),
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(47.218371, -1.553621), // Centrer sur Nantes
                  zoom: 13.0,
                ),
                nonRotatedChildren: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(markers: markers),
                ], children: [],
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/registration');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('Créer une demande de garde'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text('Demander conseil'),
          ),
        ],
      ),
    );
  }
}