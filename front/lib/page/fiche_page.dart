import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FichePage extends StatelessWidget {

  final String nomPlante;
  final String geoLocation;
  final String imageUrl;
  final String proprietaire;

  FichePage({
    required this.nomPlante,
    required this.geoLocation,
    required this.imageUrl,
    required this.proprietaire,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomPlante),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icône de flèche vers la gauche
          onPressed: () {
            context.go('/map'); // Navigue vers '/map' en utilisant GoRouter
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nom: $nomPlante',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Géolocalisation: $geoLocation',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Propriétaire: $proprietaire',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}