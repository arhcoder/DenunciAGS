import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
  File? _imageFile1;
  File? _imageFile2;
  Uint8List webImageF = Uint8List(8);
  Uint8List webImageB = Uint8List(8);

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
                          _pickImage();
                        },
                        child: _imageFile1 == null
                            ? Icon(
                                Icons.upload,
                                size: 180,
                              )
                            : kIsWeb
                                ? Image.memory(webImageF, fit: BoxFit.fill)
                                : Image.file(_imageFile1!, fit: BoxFit.fill)),
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
                          _pickImage();
                        },
                        child: _imageFile2 == null
                            ? Icon(
                                Icons.upload,
                                size: 180,
                              )
                            : kIsWeb
                                ? Image.memory(webImageB, fit: BoxFit.fill)
                                : Image.file(_imageFile2!, fit: BoxFit.fill)),
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
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Denuncia3()))
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

  //Recuperar imagenes
  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var selected = File(image.path);
        setState(() {
          if (_imageFile1 != null && _imageFile1!.lengthSync() > 0) {
            _imageFile2 = selected;
          } else {
            _imageFile1 = selected;
          }
        });
      } else {
        print("No hay imagen seleccionada");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          if (!webImageF.every((byte) => byte == 0)) {
            webImageB = f;
            _imageFile2 = File('a');
          } else {
            webImageF = f;
            _imageFile1 = File('a');
          }
        });
      } else {
        print("No hay imagen seleccionada");
      }
    } else {
      print("Algo anda mal...");
    }
  }

  //Mandar imagenes
  Future<void> enviarImagen() async {
    String url = 'https://ejemplo.com/mi-endpoint';
    http.Response respuesta;
    if (kIsWeb) {
      // Convierte la lista de bytes en un objeto String
      String imagenCodificadaF = base64Encode(webImageF);
      String imagenCodificadaT = base64Encode(webImageB);

      // Define el cuerpo de la petición POST
      Map<String, String> cuerpo = {
        'imagenF': imagenCodificadaF,
        'imagenT': imagenCodificadaT
      };

      // Envía la petición POST
      respuesta = await http.post(Uri.parse(url), body: cuerpo);
    } else {
      // Crea un objeto `http.MultipartRequest` para manejar la petición POST
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(url));

      if (_imageFile1?.path != null) {
        http.MultipartFile archivo1Part =
            await http.MultipartFile.fromPath('imagenF', _imageFile1!.path);
        request.files.add(archivo1Part);
      }

      if (_imageFile2?.path != null) {
        http.MultipartFile archivo2Part =
            await http.MultipartFile.fromPath('imagenT', _imageFile2!.path);
        request.files.add(archivo2Part);
      }

      // Envía la petición POST y espera la respuesta
      respuesta = await http.Response.fromStream(await request.send());
    }

    // Verifica el código de estado de la respuesta
    if (respuesta.statusCode == 200) {
      print("Se hizo el envio de forma adecuada");
    } else {
      // La petición falló
      print("Fallo el envuio");
    }
  }
}
