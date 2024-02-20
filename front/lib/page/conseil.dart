import 'dart:convert'; // Pour la conversion de données JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Pour effectuer des requêtes HTTP
import 'package:go_router/go_router.dart';

class ConseilPage extends StatelessWidget {
  const ConseilPage({Key? key}) : super(key: key);

  // Fonction pour récupérer les informations de la plante depuis l'API
  Future<void> _fetchPlantInfo(String plantName) async {
    try {
      // URL de votre API pour récupérer les informations de la plante
      final apiUrl = Uri.parse('http://localhost:8080/api/v1/plantes/search/findByNom?nom=$plantName');

      // Envoi de la requête GET à l'API
      final response = await http.get(apiUrl);

        print(response.body);
      // Vérification de la réussite de la requête
      if (response.statusCode == 200) {
        // Conversion de la réponse JSON en Map
        final Map<String, dynamic> responseData = json.decode(response.body);
        // Traitement des données ici, par exemple, affichage des informations dans la console
        print(responseData);
      } else {
        // Gestion des erreurs si la requête échoue
        print('Failed to fetch plant info: ${response.statusCode}');
      }
    } catch (e) {
      // Gestion des erreurs génériques
      print('Error fetching plant info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    String plantName = ''; // Variable pour stocker le nom de la plante

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arosa-Te'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.green[100],
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Demandez conseil',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.loupe),
                labelText: 'Nom de la plante',
              ),
              onChanged: (value) {
                // Mettre à jour la variable du nom de la plante à mesure que l'utilisateur tape
                plantName = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Appeler la fonction pour récupérer les informations de la plante depuis l'API
                _fetchPlantInfo(plantName);

                // Navigation vers "/homepage"
               //GoRouter.of(context).go('/homepage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Rechercher'),
            ),
          ],
        ),
      ),
    );
  }
}
