import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:mae_projet/page/registrationImage.dart';
import 'package:path_provider/path_provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras!.first, ResolutionPreset.medium);
    await _controller!.initialize();
    setState(() {}); // Rafraîchir l'interface utilisateur après l'initialisation de la caméra
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur : la caméra n\'est pas prête.')),
      );
      return;
    }
    try {
      XFile picture = await _controller!.takePicture();
      String repertoireImage = (await getApplicationDocumentsDirectory()).path;
      String nomFichier = 'image_capturee.png';
      String chemin = '$repertoireImage/$nomFichier';
      await picture.saveTo(chemin);
      // Afficher une boîte de dialogue avec les options
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Que voulez-vous faire ?'),
            actions: <Widget>[
              TextButton(
                child: Text('Conserver la photo'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Future.delayed(Duration(milliseconds: 100), ()
                  {
                    // Sauvegardez la p,k,hoto ou effectuez votre action ici
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          RegistrationImagePage(imagePath: chemin),
                    ));
                  });// Fermer la boîte de dialogue après avoir navigué
                },
              ),
              TextButton(
                child: Text('Reprendre la photo'),
                onPressed: () {
                  // Supprimez la photo ou effectuez l'action de reprise ici
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print("Chemin de la photo : $chemin");
    } catch (e) {
      // Gérer l'erreur ici
      print(e);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
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
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.green[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enregistrement',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Affichage de l'aperçu de la caméra
            Expanded(
              child: _controller?.value.isInitialized ?? false
                  ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: CameraPreview(_controller!),
              )
                  : const Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _takePicture,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Prendre une photo'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

