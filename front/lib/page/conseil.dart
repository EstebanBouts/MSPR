import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';

class PlantInfo {
  final String name;
  final String type;
  final String description;
  final String instructionsSoin;
  final String imageUrl;

  PlantInfo({
    required this.name,
    required this.type,
    required this.description,
    required this.instructionsSoin,
    required this.imageUrl,
  });

  factory PlantInfo.fromJson(Map<String, dynamic> json) {
    return PlantInfo(
      name: json['nom'],
      type: json['type'],
      description: json['description'] ?? 'Description non disponible',
      instructionsSoin: json['instructionsSoin'] ?? 'Instructions non disponibles',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}

class ConseilPage extends StatefulWidget {
  const ConseilPage({Key? key}) : super(key: key);

  @override
  _ConseilPageState createState() => _ConseilPageState();
}

class _ConseilPageState extends State<ConseilPage> {
  String plantName = '';
  PlantInfo? plantInfo;
  late List<String> _plantNames;
  late TextEditingController _plantNameController;

  @override
  void initState() {
    super.initState();
    _plantNames = [];
    _fetchPlantNames();
    _plantNameController = TextEditingController();
  }

  Future<void> _fetchPlantNames() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/plantes'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> plantes = data['_embedded']['plantes'];
        final List<String> plantNames = plantes.map((plante) => plante['nom'] as String).toList();
        setState(() {
          _plantNames = plantNames;
        });
      } else {
        throw Exception('Failed to load plant names');
      }
    } catch (e) {
      print('Error fetching plant names: $e');
    }
  }

  Future<void> _fetchPlantInfo(String plantName) async {
    try {
      final apiUrl = Uri.parse(
          'http://10.0.2.2:8080/api/v1/plantes/search/findByNom?nom=$plantName');

      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.isNotEmpty) {
          final plantData = responseData;
          setState(() {
            plantInfo = PlantInfo.fromJson(plantData);
          });
        } else {
          setState(() {
            plantInfo = null;
          });
        }
      } else {
        print('Failed to fetch plant info: ${response.statusCode}');
        setState(() {
          plantInfo = null;
        });
      }
    } catch (e) {
      print('Error fetching plant info: $e');
      setState(() {
        plantInfo = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/map');
          },
        ),
        title: const Text('Arosa-Je'),
        centerTitle: true,  
        backgroundColor: Colors.green[800],
      ),
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Demandez conseil',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _plantNameController,
                      onChanged: (value) {
                        setState(() {
                          plantName = value;
                        });
                      },
                      decoration: InputDecoration(
                        icon: Icon(Icons.loupe),
                        labelText: 'Nom de la plante',
                        suffixIcon: PopupMenuButton<String>(
                          icon: Icon(Icons.arrow_drop_down),
                          itemBuilder: (BuildContext context) {
                            return _plantNames.map((String plantName) {
                              return PopupMenuItem<String>(
                                value: plantName,
                                child: Text(plantName),
                              );
                            }).toList();
                          },
                          onSelected: (String value) {
                            setState(() {
                              _plantNameController.text = value;
                              plantName = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _fetchPlantInfo(plantName);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('Rechercher'),
              ),
              if (plantInfo != null) ...[
                const SizedBox(height: 20),
                if (plantInfo!.imageUrl.isNotEmpty)
                  Container(
                    height: 500,
                    width: double.infinity,
                    child: Image.network(
                      plantInfo!.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  'Nom de la plante:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(plantInfo!.name),
                const SizedBox(height: 10),
                Text(
                  'Type:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(plantInfo!.type),
                const SizedBox(height: 10),
                Text(
                  'Description:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(plantInfo!.description),
                const SizedBox(height: 10),
                Text(
                  'Instructions de soin:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(plantInfo!.instructionsSoin),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
