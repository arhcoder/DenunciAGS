import 'package:denunciasapp/models/denuncia.dart';
import 'package:denunciasapp/screens/homescreen.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_form_widget1.dart';
import '../widgets/subtitlesags.dart';
import '../widgets/titlesags.dart';

class Denuncia5 extends StatelessWidget {
  const Denuncia5({Key? key}) : super(key: key);
//AQUÍ TENEMOS QUE HACER EL REQUEST DEL NUMERO DE SEGUIMIENTO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ULTIMOS PASOS"),
        backgroundColor: Color.fromARGB(255, 44, 41, 115),
      ),
      body: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Center(
            heightFactor: 1,
            child: Column(
              children: [
                const TitlesAgs(
                    texto: "GRACIAS POR REALIZAR TU DENUNCIA ANONIMA"),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                  child: Text(
                    "REGRESAR",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
