import 'dart:convert';

import 'package:denunciasapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screens/denuncia6.dart';
import '../screens/homescreen.dart';

// Defining a custom Form widget.
class CustomForm1 extends StatefulWidget {
  const CustomForm1({super.key});

  CustomForm1State createState() {
    return CustomForm1State();
  }
}

// Defining a corresponding State class.
class CustomForm1State extends State<CustomForm1> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String llave;
  Widget build(BuildContext context) {
    // Building a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextBox(
              controller: _controller,
              label: "INGRESE UN NUMERO DE SEGUIMIENTO"),
          SizedBox(
            height: 40,
          ),
          // Add TextFormFields and ElevatedButton here.

          Container(
            height: 50,
            width: 150,
            child: Container(
              height: 60,
              width: 250,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(elevation: 20),
                  onPressed: () async {
                    String datos = await getData();
                    Map<String, dynamic> respuestaMap = json.decode(datos);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Denuncia6(
                                  respuesta: respuestaMap,
                                )));
                  },
                  child: Text(
                    "CONSULTAR ESTATUS",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getData() async {
    final llave = _controller.text;
    final response = await http.get(Uri.parse(
        'https://emilioenlaluna-reimagined-space-59q6wpv4prqh4jrj-8000.preview.app.github.dev/seguimiento/${llave}/'));
    if (response.statusCode == 200) {
      // El servidor ha respondido correctamente
      // Puedes acceder al contenido de la respuesta en response.body
      print(response.body[0]);
      return response.body;
    } else {
      // El servidor ha devuelto un error
      print('Error ${response.statusCode}: ${response.reasonPhrase}');
    }
    return "";
  }
}
