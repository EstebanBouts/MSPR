import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationImagePage extends StatefulWidget {
  final String imagePath;

  const RegistrationImagePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  _RegistrationImagePageState createState() => _RegistrationImagePageState();
}

class _RegistrationImagePageState extends State<RegistrationImagePage> {
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom de la variété',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Affichage de la photo prise
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8), // Marge extérieure pour le cadre
                // La photo doit occuper tout l'espace disponible
                decoration: BoxDecoration(
                  color: Colors.white, // Couleur de fond pour le cadre
                ),
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover), // Affichage de l'image
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Demander conseil'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Faire garder sa plante'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Déconnexion'),
            ),
          ],
        ),
      ),
    );
  }
}

