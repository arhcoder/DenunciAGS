import 'package:denunciasapp/models/denuncia.dart';
import 'package:denunciasapp/screens/denuncia6.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/custom_form_widget1.dart';
import '../widgets/subtitlesags.dart';
import '../widgets/titlesags.dart';

class Denuncia5 extends StatelessWidget {
  final llave;
  const Denuncia5({required this.llave, Key? key}) : super(key: key);
//AQUÍ TENEMOS QUE HACER EL REQUEST DEL NUMERO DE SEGUIMIENTO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ULTIMOS PASOS"),
        backgroundColor: Color.fromARGB(255, 44, 41, 115),
      ),
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                const TitlesAgs(texto: "GRACIAS POR REALIZAR TU DENUNCIA"),
                SizedBox(
                  height: 40,
                ),
                //AQUÍ VA EL NUMERO DE SEGUIMIENTO
                Text(
                  "3B6C0DF0",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                SubTitlesAgs(texto: "ESTE ES TU NUMERO DE SEGUIMIENTO"),
                SizedBox(
                  height: 50,
                ),

                Container(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 20),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Denuncia6()));
                      },
                      child: Text(
                        "CONSULTAR ESTATUS",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "FAVOR DE LLAMAR AL 449-####### O ACUDIR DIRECTAMENTE A LAS OFICINASPARA CONFIRMAR SU DENUNCIA CON EL NUMERO DE SEGUIMIENTO",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "SI ESTE PASO NO SE REALIZA DENTRO DE LOS PROXIMOS 15 DÍAS, SU DENUNCIA SERÁ DESCARTADA Y TENDRÁ QUE REALIZARLA DE NUEVO",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> getData() async {
    final response = await http.get(Uri.parse(
        'https://emilioenlaluna-reimagined-space-59q6wpv4prqh4jrj-8000.preview.app.github.dev/seguimiento/${llave}/'));
    if (response.statusCode == 200) {
      // El servidor ha respondido correctamente
      // Puedes acceder al contenido de la respuesta en response.body
      print(response.body);
      return response.body;
    } else {
      // El servidor ha devuelto un error
      print('Error ${response.statusCode}: ${response.reasonPhrase}');
    }
    return "";
  }
}
