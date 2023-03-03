import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot - Seguridad Aguascalientes',
      home: MyApiWidget(),
    );
  }
}

class MyApiWidget extends StatefulWidget {
  @override
  _MyApiWidgetState createState() => _MyApiWidgetState();
}

class _MyApiWidgetState extends State<MyApiWidget> {
  final _textController = TextEditingController();
  final List<Message> _messages = [];
  var cookie = 'codespaces_correlation_id=a58d58a6fa51ad3b2a69fba25fe6599f';

  Future<void> _sendTextToApi(String message) async {
    final apiUrl = Uri.parse(
        "https://emilioenlaluna-reimagined-space-59q6wpv4prqh4jrj-8000.preview.app.github.dev/algoritms/chatv2/");
    final response = await http.post(
      apiUrl,
      body: {
        'message': message,
      },
      headers: {
        'Cookie': cookie,
      },
    );

    if (response.statusCode == 200) {
      final apiMessage = Message(text: response.body, isUser: false);
      setState(() {
        _messages.add(apiMessage);
      });
    } else {
      final errorMessage = Message(
        text: "Fallo en la API",
        isUser: false,
      );
      setState(() {
        _messages.add(errorMessage);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 41, 115),
        title: Text("Bot Security Aguascalientes"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: message.isUser ? Colors.blue : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyle(
                          color: message.isUser ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(16.0),
            ),
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Escribe tu mensaje",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    final userMessage =
                        Message(text: _textController.text, isUser: true);
                    setState(() {
                      _messages.add(userMessage);
                      _textController.clear();
                    });
                    await _sendTextToApi(userMessage.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
