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
                    controller: controllerFecha, label: "FECHA DE LOS HECHOS"),
                SizedBox(height: 20.0),
                TextBox(
                    controller: controllerHora,
                    label: "HORA DE LOS HECHOS (OPCIONAL)"),
                SizedBox(height: 50.0),
                SubTitlesAgs(texto: "LUGAR DONDE SUCEDIERON LOS HECHOS"),
                SizedBox(height: 50.0),
                TextBox(controller: controllerCalleHechos, label: "CALLE"),
                SizedBox(height: 20.0),
                TextBox(
                    controller: controllerEntreCalleHechos1,
                    label: "ENTRE CALLE 1"),
                SizedBox(height: 20.0),
                TextBox(
                    controller: controllerEntreCalleHechos2,
                    label: "ENTRE CALLE 2"),
                SizedBox(height: 20.0),
                TextBox(
                    controller: controllerUbicacionActualHechos,
                    label: "TE UBICABAS EN (DESCRIPCIÓN DEL LUGAR)"),
                SizedBox(height: 100.0),
                SubTitlesAgs(texto: "NARRATIVA"),
                SizedBox(height: 150.0),
                TextBox(
                    controller: controllerNarrativaDenuncia,
                    label: "CUENTANOS LO QUE SUCEDIÓ"),
                SizedBox(height: 100.0),
                SubTitlesAgs(texto: "PRUEBAS"),
                SizedBox(height: 100.0),
                SubTitlesAgs(texto: "TESTIGOS"),
                SizedBox(height: 100.0),
                TextBox(
                    controller: controllerTestigos,
                    label: "INGRESA LOS NOMBRES DE LOS TESTIGOS"),
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
                    Text("DENUNCIA NO ANONIMA"),
                  ],
                ),
                TextBox(
                  controller: controllerTelefonoDenunciante,
                  label: "INGRESA TU TELEFONO",
                  onlyText: !_isChecked,
                ),
                TextBox(
                  controller: controllerCorreoDenunciante,
                  label: "INGRESA TU CORREO",
                  onlyText: !_isChecked,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Denuncia5(),
                        ),
                      );
                    }
                  },
                  child: Text('CONTINUAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendFormData() async {
    var url = Uri.parse('http://example.com/api/form-data');
    var request = http.MultipartRequest('POST', url);
    //var imageBytes = await widget.reporte.image!.readAsBytes();
    Map<String, dynamic> datos = {"curp": widget.reporte.curp1};
  }
}
