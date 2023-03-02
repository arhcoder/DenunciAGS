import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:denunciasapp/screens/denuncia3.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

import '/screens/denuncia3.dart';
import 'package:flutter/material.dart';
import '/widgets/subtitlesags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

import 'package:image_picker/image_picker.dart';

class Denuncia2 extends StatefulWidget {
  const Denuncia2({Key? key}) : super(key: key);

  @override
  _Denuncia2 createState() => _Denuncia2();
}

class _Denuncia2 extends State<Denuncia2> {
  Uint8List webImageF = Uint8List(8);
  Uint8List webImageT = Uint8List(8);
  bool _picker1 = false;
  bool _picker2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IDENTIFICACIÓN"),
        backgroundColor: Color.fromARGB(255, 44, 41, 115),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TitlesAgs(texto: "DENUNCIAS AL ALCANCE DE TODOS"),
                SizedBox(height: 20),
                SubTitlesAgs(texto: "FRENTE DE LA IDENTIFICACIÓN OFICIAL"),
                //AQUÍ POSICIONAR LA CARGA DE FOTOGRAFÍA DE LA INE PARTE FRONTAL
                SizedBox(
                  height: 20,
                ),
                Padding(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.withOpacity(0.2)),
                        onPressed: () {
                          _pickImage(1);
                        },
                        child: _picker1
                            ? Icon(
                                Icons.upload,
                                size: 180,
                              )
                            : Image.memory(webImageF, fit: BoxFit.fill)),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                SubTitlesAgs(texto: "REVERSO DE LA IDENTIFICACIÓN OFICIAL"),
                //AQUÍ POSICIONAMOS LA CARGA DE FOTOGRAFÍA DE LA INE PARTE TRASERA
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.withOpacity(0.2)),
                        onPressed: () {
                          _pickImage(2);
                        },
                        child: _picker2
                            ? Icon(
                                Icons.upload,
                                size: 180,
                              )
                            : Image.memory(webImageT, fit: BoxFit.fill)),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    //ACCIÓN AL PRESIONAR
                    //AQUÍ SE VAN A TENER QUE HACER TODOS LOS JALES DE RECONOCIMIENTO DE LOS DATOS DE LA INE
                    onPressed: () async {
                      String datos = await enviarImagen();
                      Map<String, dynamic> respuestaMap = json.decode(datos);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Denuncia3(
                                    datosINE: respuestaMap,
                                  )));
                    },
                    child: const Text("CONTINUAR"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Recuperar imagenes 0709
  Future<void> _pickImage(int picker) async {
    final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if(!kIsWeb) {
        XFile? image = await _picker.pickImage(source: ImageSource.camera);
      }
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          switch(picker) {
            case 1: webImageF = f; _picker1 = true; break;
            case 2: webImageT = f; _picker2 = true; break;
          }
        });
      } else {
        switch(picker) {
            case 1: _picker1 = false; break;
            case 2: _picker2 = false; break;
          }
        print("No hay imagen seleccionada");
      }
  }

  //Mandar imagenes
  Future<String> enviarImagen() async {
    String url =
        'https://emilioenlaluna-reimagined-space-59q6wpv4prqh4jrj-8000.preview.app.github.dev/algoritms/send_ine/';
    http.Response respuesta;
    // Convierte la lista de bytes en un objeto String
    String imagenCodificadaF = base64Encode(webImageF);
    String imagenCodificadaT = base64Encode(webImageT);
    // Define el cuerpo de la petición POST
    Map<String, String> cuerpo = {
      'imagenF': imagenCodificadaF,
      'imagenT': imagenCodificadaT
    };
    
    respuesta = await http.post(Uri.parse(url), body: json.encode(cuerpo));

    // Verifica el código de estado de la respuesta
    if (respuesta.statusCode == 200) {
      print("Se hizo el envio de forma adecuada");
      print(respuesta.body);

      return respuesta.body;
    } else {
      // La petición falló
      print("Fallo el envio ${respuesta.statusCode}");
    }
    return "";
  }
}