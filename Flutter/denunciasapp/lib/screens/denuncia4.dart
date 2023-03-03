import 'dart:typed_data';

import 'package:denunciasapp/models/denuncia.dart';
import 'dart:ui' as ui;
import 'package:denunciasapp/widgets/MySignature.dart';
import 'package:denunciasapp/widgets/select_menu.dart';
import 'package:denunciasapp/widgets/text_box.dart';

import '/screens/homescreen.dart';
import 'denuncia3.dart';
import '/widgets/custom_textformfield1.dart';
import '/widgets/subtitlesags.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'denuncia5.dart';

import 'dart:convert';

class Denuncia4 extends StatefulWidget {
  Denuncia reporte = new Denuncia(anonima: false);

  Denuncia4({required this.reporte});
  @override
  _Denuncia4State createState() => _Denuncia4State();
}

class _Denuncia4State extends State<Denuncia4> {
  final signatureKey = GlobalKey<SignatureState>();
  bool _isChecked = false;
  List<Widget> _textFields = [];
  String? _selectedOption1;
  String? _selectedOption2;
  List<String> _options2 = [];
  late TextEditingController controllerFecha = new TextEditingController();
  late TextEditingController controllerHora = new TextEditingController();
  late TextEditingController controllerCalleHechos =
      new TextEditingController();
  late TextEditingController controllerEntreCalleHechos1 =
      new TextEditingController();
  late TextEditingController controllerEntreCalleHechos2 =
      new TextEditingController();
  late TextEditingController controllerUbicacionActualHechos =
      new TextEditingController();
  late TextEditingController controllerNarrativaDenuncia =
      new TextEditingController();
  late TextEditingController controllerTestigos = new TextEditingController();
  late TextEditingController controllerImagePath = new TextEditingController();
  late TextEditingController controllerAnonima = new TextEditingController();
  late TextEditingController controllerTelefonoDenunciante =
      new TextEditingController();
  late TextEditingController controllerCorreoDenunciante =
      new TextEditingController();

  Map<String, List<String>> _optionsMap = {
    "ROBO DE OBJETOS": ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"],
    "ROBO DE VEHÍCULOS": ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"],
    "ROBO A CASA HABITACIÓN": ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"],
    "VIOLENCIA DOMESTICA": [
      "ACOSO",
      "AGRESION",
      "VIOLENCIA FÍSICA",
      "PRIVACIÓN DE LA LIBERTAD"
    ],
    "LESIONES CULPUSOS": ["SIMPLES", "GRAVES", "CAUSANTES DE MUERTE"],
    "LESIONES DOLOSAS": [
      "PREMEDITACIÓN",
      "VENTAJA",
      "ALEVOSÍA",
      "TRAICIÓN",
      "BRUTAL FEROCIDAD"
    ],
    "DAÑO A LA PROPIEDAD": [],
    "AMENAZAS": [],
    "DELITOS CONTRA LA SALUD RELACIONADOS CON NARCÓTICOS": [],
    "FRAUDE": [],
    "HOMICIDIO": [],
    "DESPOJO": [],
    "BUSO DE CONFIANZA": [],
    "ABUSO SEXUAL": [],
    "DELITOS CONTRA MENORES": [
      "ABUSO SEXUAL",
      "TRATA DE MENORES",
      "MALTRATO",
      "PRIVACION DE LA LIBERTAD",
      "PORNOGRAFÍA"
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CONFIRMACIÓN DE DATOS"),
        backgroundColor: Color.fromARGB(255, 44, 41, 115),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                SubTitlesAgs(texto: "DATOS DE LA DENUNCIA"),
                SizedBox(
                  height: 40,
                ),
                DropdownButton<String>(
                  hint: Text('Selecciona una opción'),
                  value: _selectedOption1,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption1 = newValue;
                      _options2 = _optionsMap[newValue!]!;
                      _selectedOption2 = null;
                    });
                  },
                  items: _optionsMap.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                DropdownButton<String>(
                  hint: Text('SELECCIONA UNA OPCIÓN'),
                  value: _selectedOption2,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption2 = newValue;
                    });
                  },
                  items:
                      _options2.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20.0),
                TextBox(
                  controller: controllerFecha,
                  label: "FECHA DE LOS HECHOS",
                  defaultText: "29/02/2021",
                ), //Sólo por motivos de pruebas defaultText
                SizedBox(height: 20.0),
                TextBox(
                  controller: controllerHora,
                  label: "HORA DE LOS HECHOS (OPCIONAL)",
                  defaultText: "25:61",
                ), //Sólo por motivos de pruebas defaultText
                SizedBox(height: 50.0),
                SubTitlesAgs(texto: "LUGAR DONDE SUCEDIERON LOS HECHOS"),
                SizedBox(height: 50.0),
                TextBox(
                  controller: controllerCalleHechos,
                  label: "CALLE",
                  defaultText: " ll Milione,",
                ), //Sólo por motivos de pruebas defaultText
                SizedBox(height: 20.0),
                TextBox(
                  controller: controllerEntreCalleHechos1,
                  label: "ENTRE CALLE 1",
                  defaultText: "Europa medieval ",
                ), //Sólo por motivos de pruebas defaultText
                SizedBox(height: 20.0),
                TextBox(
                  controller: controllerEntreCalleHechos2,
                  label: "ENTRE CALLE 2",
                  defaultText: "Asia Central",
                ), //Sólo por motivos de pruebas defaultText
                SizedBox(height: 20.0),
                TextBox(
                  controller: controllerUbicacionActualHechos,
                  label: "TE UBICABAS EN (DESCRIPCIÓN DEL LUGAR)",
                  defaultText: "Batalla naval de Curzola",
                ), //Sólo por motivos de pruebas defaultText
                SizedBox(height: 100.0),
                SubTitlesAgs(texto: "NARRATIVA"),
                SizedBox(height: 150.0),
                TextBox(
                  controller: controllerNarrativaDenuncia,
                  label: "CUENTANOS LO QUE SUCEDIÓ",
                  defaultText:
                      "Los genoveses y los venecianos comenzaron a asesinarse entre ellos con armas punzo cortantes",
                ), //Sólo por motivos de pruebas defaultText
                SizedBox(height: 100.0),
                SubTitlesAgs(texto: "PRUEBAS"),
                SizedBox(height: 100.0),
                SubTitlesAgs(texto: "TESTIGOS"),
                SizedBox(height: 100.0),
                TextBox(
                  controller: controllerTestigos,
                  label: "INGRESA LOS NOMBRES DE LOS TESTIGOS",
                  defaultText: "Almirante Andrea Dandolo",
                ), //Sólo por motivos de pruebas defaultText
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text("DENUNCIA ANONIMA"),
                  ],
                ),
                TextBox(
                  controller: controllerTelefonoDenunciante,
                  label: "INGRESA TU TELEFONO",
                  onlyText: !_isChecked,
                  defaultText:
                      "449-111-0000", //Sólo por motivos de pruebas defaultText
                ),
                TextBox(
                  controller: controllerCorreoDenunciante,
                  label: "INGRESA TU CORREO",
                  onlyText: !_isChecked,
                  defaultText:
                      "marco.polo@hotmail.mx", //Sólo por motivos de pruebas defaultText
                ),
                SubTitlesAgs(texto: "FIRMA"),
                Card(
                  elevation: 4.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    child: Signature(
                        key: signatureKey,
                        cardSize:
                            Size(MediaQuery.of(context).size.width, 200.0)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_selectedOption1 != null &&
                        controllerFecha.text != "" &&
                        controllerHora.text != "" &&
                        controllerCalleHechos.text != "" &&
                        controllerUbicacionActualHechos.text != "" &&
                        controllerTestigos != "") {
                      ui.Image? image =
                          await signatureKey.currentState?.getImage();
                      print("Sí se pudo");
                      widget.reporte.setSecondDatas(
                          _selectedOption1,
                          _selectedOption2,
                          controllerFecha.text,
                          controllerHora.text,
                          controllerCalleHechos.text,
                          controllerEntreCalleHechos1.text,
                          controllerEntreCalleHechos2.text,
                          controllerUbicacionActualHechos.text,
                          controllerNarrativaDenuncia.text,
                          controllerTestigos.text,
                          _isChecked,
                          controllerTelefonoDenunciante.text,
                          controllerCorreoDenunciante.text,
                          image);
                      sendFormData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Denuncia5(llave: "",),
                        ),
                      );
                    }
                  },
                  child: Text('CONTINUAR'),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendFormData() async {
    String url =
        'https://emilioenlaluna-reimagined-space-59q6wpv4prqh4jrj-8000.preview.app.github.dev/create/';

    http.Response respuesta;

    final ByteData? imageData = await widget.reporte.image?.toByteData();
    final Uint8List? bytes = imageData?.buffer.asUint8List();
    final String encodedImage = base64Encode(bytes!);

    

    /*
    Map<String, dynamic> cuerpo = {
      "nombre": widget.reporte.nombre1,
      "curp": widget.reporte.curp1,
      "descripcion": widget.reporte.narrativa_denuncia,
      "tipodenuncia": widget.reporte.descripciontipo,
      "accion_denuncia": widget.reporte.descripciontipo,
      "fecha_hechos": widget.reporte.fecha,
      "hora_hechos": widget.reporte.hora,
      "lugar_hechos": widget.reporte.ubicacion_actual_hechos,
      "testigos": widget.reporte.testigos,
      "denuncia_anonima": widget.reporte.anonima,
      "telefono_denunciante": widget.reporte.telefono_denunciante,
      "correo_denunciante": widget.reporte.correo_denunciante,
      "firma": encodedImage,
      "nombredenunciado": widget.reporte.nombre2,
      "entreCalleUno_denuncia": widget.reporte.entre_calle_hechos1,
      "entreCalleDos_denuncia": widget.reporte.entre_calle_hechos2,
      "municipio_denunciado": widget.reporte.municipio2,
      "colonia_denunciado": widget.reporte.colonia2,
      "calle_denunciado": widget.reporte.calle2,
      "numExterior_denunciado": widget.reporte.noexterior2,
      "numInterior_denunciado": widget.reporte.nointerior1,
      "municipio_denunciador": widget.reporte.municipio1,
      "colonia_denunciador": widget.reporte.colonia1,
      "calle_denunciador": widget.reporte.calle1,
      "numExterior_denunciador": widget.reporte.noexterior1,
      "numInterior_denunciador": widget.reporte.nointerior1,
    };*/

    final headers = {"Content-Type": "multipart/form-data"};
    final cuerpo =
    {
        "nombre": "" + widget.reporte.nombre1.toString(),
        "curp": ""+ widget.reporte.curp1.toString()
    };

    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll(headers);
    request.fields.addAll(cuerpo);
    
    respuesta = await http.Response.fromStream(await request.send());
    // respuesta = await http.post(Uri.parse(url), headers: headers, body: json.encode(cuerpo));

    if (respuesta.statusCode == 200 || respuesta.statusCode == 201) {
      print("Se hizo el envio de forma adecuada");
      print(respuesta.body);
    } else {
      // La petición falló
      print("Fallo el envio ${respuesta.statusCode}");
    }
  }
}