import 'package:denunciasapp/widgets/select_menu.dart';
import 'package:denunciasapp/widgets/text_box.dart';

import '/screens/homescreen.dart';
import '/widgets/custom_textformfield1.dart';
import '/widgets/subtitlesags.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class FormularioDenunciante extends StatefulWidget {
  @override
  _FormularioDenuncianteState createState() => _FormularioDenuncianteState();
}

class _FormularioDenuncianteState extends State<FormularioDenunciante> {
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
    "VIOLENCIA DOMESTICA": [],
    "LESIONES CULPUSOS": [],
    "LESIONES DOLOSAS": [],
    "DAÑO A LA PROPIEDAD": [],
    "AMENAZAS": [],
    "DELITOS CONTRA LA SALUD RELACIONADOS CON NARCÓTICOS": [],
    "FRAUDE": [],
    "HOMICIDIO": [],
    "DESPOJO": [],
    "BUSO DE CONFIANZA": [],
    "ABUSO SEXUAL": [],
    "DELITOS CONTRA MENORES": [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                hint: Text('Selecciona una opción'),
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
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
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
              //INSERTAR WIDGET DE LA FIRMA

              ElevatedButton(
                onPressed: () {},
                child: Text('CONTINUAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




/*
// Defining a custom Form widget.
class FormularioDenunciante extends StatefulWidget {
  final List<String> reportOption;
  final String selectedOption;

  const FormularioDenunciante({
    Key? key,
    this.reportOption = const [
      "ROBO DE OBJETOS",
      "ROBO DE VEHÍCULOS",
      "ROBO A CASA HABITACIÓN",
      "VIOLENCIA DOMESTICA",
      "LESIONES CULPUSOS",
      "LESIONES DOLOSAS",
      "DAÑO A LA PROPIEDAD",
      "AMENAZAS",
      "DELITOS CONTRA LA SALUD RELACIONADOS CON NARCÓTICOS",
      "FRAUDE",
      "HOMICIDIO",
      "DESPOJO",
      "BUSO DE CONFIANZA",
      "ABUSO SEXUAL",
      "DELITOS CONTRA MENORES"
    ],
    this.selectedOption = "ROBO DE OBJETOS",
  }) : super(key: key);

  FormularioDenuncianteState createState() {
    return FormularioDenuncianteState();
  }
}

// Defining a corresponding State class.
class FormularioDenuncianteState extends State<FormularioDenunciante> {
  final _formKey = GlobalKey<FormState>();
  List<String> _actionOpcions = [];
  String? _report;
  String? _report2;
  @override
  Widget build(BuildContext context) {
    // Building a Form widget using the _formKey created above.
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SelectMenuWidget(
                hinttext: "¿Cúal opción se acerca más a su denuncia?",
                options: widget.reportOption,
                selectedOption: widget.selectedOption,
                onChanged: (value) {
                  _report = value;
                  setState(() {
                    selectAction(_report);
                  });
                },
                obligatory: true),
            if (_actionOpcions.isNotEmpty)
              SelectMenuWidget(
                  hinttext: "¿Cual describe mejor su denuncia?",
                  options: _actionOpcions,
                  selectedOption: "                           ",
                  onChanged: (value) {
                    _report2 = value;
                  },
                  obligatory: true),
          ],
        ),
      ),
    );
  }

  void selectAction(String? report) {
    switch (report) {
      case "ROBO DE OBJETOS":
        _actionOpcions = ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"];
        break;
      case "ROBO DE VEHÍCULOS":
        _actionOpcions = ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"];
        break;
      case "ROBO A CASA HABITACIÓN":
        _actionOpcions = ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"];
        break;
      case "VIOLENCIA DOMESTICA":
        break;
      case "LESIONES DOLOSAS":
        break;
      case "LESIONES CULPOSAS":
        break;
    }
  }
}
*/