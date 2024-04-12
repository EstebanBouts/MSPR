import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages(); // Charger les messages au démarrage
  }

  Future<void> _loadMessages() async {
    try {
      var url = Uri.parse('http://10.0.2.2:3000/messages');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> messagesJson = json.decode(response.body);
        setState(() {
          _messages.clear();
          for (var messageJson in messagesJson) {
            _messages.add(ChatMessage(
              text: messageJson['texte'],
              time: DateTime.parse(messageJson['dateEnvoi']),
              envoyePar: messageJson['envoyePar'],
            ));
          }
        });
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      print('Erreur lors du chargement des messages: $e');
    }
  }

  Future<void> _sendToServer(String text) async {
    try {
      var url = Uri.parse('http://10.0.2.2:3000/messages');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'texte': text,
          // Assurez-vous que cette valeur correspond à un utilisateur valide dans votre base de données
          'envoyePar': 'Esteban BOUTS',
          'dateEnvoi': DateTime.now().toIso8601String(),
        }),
      );
      if (response.statusCode == 201) {
        _loadMessages(); // Recharger les messages après l'envoi
      } else {
        print('Failed to send message');
      }
    } catch (e) {
      print('Erreur lors de l\'envoi du message: $e');
    }
  }

  void _sendMessage() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      _sendToServer(text);
      _controller.clear();
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
        title: const Text('Chat Arosa-Je'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: Colors.green[100],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green[800],
                          child: Text(
                            msg.envoyePar.substring(0, 1),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          msg.text,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        subtitle: Text(
                          "${msg.envoyePar} à ${_formatDateTime(msg.time)}",
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: 'Écrire un message...',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.green[800]),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}

class ChatMessage {
  String text;
  DateTime time;
  String envoyePar;

  ChatMessage({required this.text, required this.time, required this.envoyePar});
}
