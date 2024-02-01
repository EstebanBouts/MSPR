import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arosa-Te'),
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
                labelText: 'Adresse mail',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Mot de passe',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/map');
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


