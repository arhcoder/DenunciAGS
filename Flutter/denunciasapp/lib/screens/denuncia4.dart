import 'package:denunciasapp/models/denuncia.dart';
import 'package:denunciasapp/widgets/select_menu.dart';
import 'package:denunciasapp/widgets/text_box.dart';

import '/screens/homescreen.dart';
import '../screens/citzen_report.dart';
import '/widgets/custom_textformfield1.dart';
import '/widgets/subtitlesags.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Denuncia4 extends StatefulWidget {
  Denuncia reporte;
  Denuncia4({required this.reporte});
  @override
  _Denuncia4State createState() => _Denuncia4State();
}

class _Denuncia4State extends State<Denuncia4> {
  bool _isChecked = false;
  List<Widget> _textFields = [];
  String? _selectedOption1;
  String? _selectedOption2;
  List<String> _options2 = [];
  late TextEditingController controllerTipo = new TextEditingController();
  late TextEditingController controllerDescripcionTipo =
      new TextEditingController();
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
        backgroundColor: Color.fromRGBO(41, 51, 115, 1),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SubTitlesAgs(texto: "DATOS DE LA DENUNCIA"),
              SizedBox(
                height: 20,
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
                items: _options2.map<DropdownMenuItem<String>>((String value) {
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
                  controller: controllerNarrativaDenuncia,
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
              //INSERTAR WIDGET DE LA FIRMA

              ElevatedButton(
                onPressed: () {
                  widget.reporte.setSecondDatas(
                      controllerTipo.text,
                      controllerDescripcionTipo.text,
                      controllerFecha.text,
                      controllerHora.text,
                      controllerCalleHechos.text,
                      controllerEntreCalleHechos1.text,
                      controllerEntreCalleHechos2.text,
                      controllerUbicacionActualHechos.text,
                      controllerNarrativaDenuncia.text,
                      controllerTestigos.text,
                      controllerImagePath.text,
                      controllerAnonima.value,
                      controllerTelefonoDenunciante.text,
                      controllerCorreoDenunciante.text);
                },
                child: Text('CONTINUAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
