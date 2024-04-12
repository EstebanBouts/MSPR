import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class RegistrationImagePage extends StatefulWidget {
  final String imagePath;

  const RegistrationImagePage({Key? key, required this.imagePath})
      : super(key: key);

  @override
  _RegistrationImagePageState createState() => _RegistrationImagePageState();
}

class _RegistrationImagePageState extends State<RegistrationImagePage> {
  late Future<List<String>> _plantNames;
  late TextEditingController _searchController;
  List<String> _filteredPlantNames = [];

  @override
  void initState() {
    super.initState();
    _plantNames = _fetchPlantNames();
    _searchController = TextEditingController();
  }

  Future<List<String>> _fetchPlantNames() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/plantes'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> plantes = data['_embedded']['plantes'];
      final List<String> plantNames = plantes.map((plante) => plante['nom'] as String).toList();
      return plantNames;
    } else {
      throw Exception('Failed to load plant names');
    }
  }

  void _filterPlantNames(String query) async {
    final List<String> allPlantNames = await _plantNames;
    setState(() {
      if (query.isEmpty) {
        _filteredPlantNames = allPlantNames;
      } else {
        _filteredPlantNames = allPlantNames.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  Future<void> _sendImageToServer(String imagePath) async {
    var uri = Uri.parse('http://10.0.2.2:8080/image'); // Remplacez par l'URL de votre serveur
    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', imagePath));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image envoyée avec succès');
    } else {
      response.stream.transform(utf8.decoder).listen((value) {
        print(value); // Pour afficher l'erreur retournée par le serveur
      });
      print('Échec de l\'envoi de l\'image');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      _filterPlantNames(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Rechercher le nom de la plante',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  itemBuilder: (BuildContext context) {
                    return _filteredPlantNames.map((String plantName) {
                      return PopupMenuItem<String>(
                        value: plantName,
                        child: Text(plantName),
                      );
                    }).toList();
                  },
                  onSelected: (String? value) {
                    setState(() {
                      _searchController.text = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Affichage de la photo prise
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _sendImageToServer(widget.imagePath); // Ajout de cette ligne pour envoyer l'image
                GoRouter.of(context).go('/map');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Valider sa demande'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
