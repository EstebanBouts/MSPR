import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Future<void> _submitForm(String email, String password, BuildContext context) async {
    final url = Uri.parse('http://10.0.2.2:8080/login');

    try {
      // Envoyer une requête POST au serveur avec email et mot de passe
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'motDePasse': password}),
      );

      // Vérifier le statut de la réponse
      if (response.statusCode == 200) {
        // Vérifier la réponse du serveur. Dans votre cas, on suppose que le serveur renvoie true pour une authentification réussie.
        final responseData = json.decode(response.body);
        if (responseData == true) {
          // Authentification réussie, naviguer vers la page suivante
          GoRouter.of(context).go('/map');
        } else {
          // Authentification échouée, afficher un message d'erreur
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Erreur'),
                content: const Text('Email ou mot de passe incorrect'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Gérer les erreurs de réponse autres que 200
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: Text('Erreur de connexion: ${response.body}'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Gérer les exceptions de la requête
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erreur'),
            content: Text('Une erreur s\'est produite. Veuillez réessayer. $error'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
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
              onPressed: () => _submitForm(email, password, context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Se connecter'),
            ),
            TextButton(
              onPressed: () => GoRouter.of(context).go('/forget'),
              child: const Text('Mot de passe oublié ?'),
            ),
            const Divider(color: Colors.black),
            TextButton(
              onPressed: () => GoRouter.of(context).go('/signup'), // Naviguer vers la page d'inscription
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      ),
    );
  }
}
