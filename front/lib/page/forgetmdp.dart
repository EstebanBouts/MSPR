import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgetMdp extends StatelessWidget {
  const ForgetMdp({Key? key}) : super(key: key);

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
        child: ListView(
          children: <Widget>[
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
