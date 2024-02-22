import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> _submitForm(String email, String password, BuildContext context) async {
    final url = Uri.parse('http://10.0.2.2:8080/api/v1/utilisateurs/search/findByEmail?email=$email');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Si la réponse est réussie, vous pouvez vérifier si le mot de passe est correct
        // À des fins de démonstration, je suppose que le serveur renvoie un objet JSON contenant un champ 'motDePasse'
        final responseData = json.decode(response.body);
        final correctPassword = responseData['motDePasse'];

        if (password == correctPassword) {
          // Mot de passe correct, naviguez vers la page suivante
          GoRouter.of(context).go('/map');
        } else {
          // Mot de passe incorrect
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Erreur'),
                content: Text('Mot de passe incorrect'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Échec de la requête HTTP
        throw Exception('Failed to load data');
      }
    } catch (error) {
      // Gérer les erreurs
      print('Error: $error');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erreur'),
            content: Text('Une erreur s\'est produite. Veuillez réessayer.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arosa-Je'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.green[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Connexion',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.mail),
                labelText: 'Email',
              ),
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Mot de passe',
              ),
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _submitForm(email, password, context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Se connecter'),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/forget');
              },
              child: const Text('Mot de passe oublié ?'),
            ),
            const Divider(color: Colors.black),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go('/signup'); // Naviguer vers la page d'inscription
              },
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      ),
    );
  }
}
