import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConseilPage extends StatelessWidget {
  const ConseilPage({Key? key}) : super(key: key);

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
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Saisissez votre E-MAIL',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 60),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/homepage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
