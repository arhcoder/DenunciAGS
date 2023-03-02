import 'package:denunciasapp/widgets/select_menu.dart';

import '/screens/homescreen.dart';
import '/widgets/custom_textformfield1.dart';
import '/widgets/subtitlesags.dart';
import 'package:flutter/material.dart';

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
  String? _action;

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
                  selectAction(value);
                },
                obligatory: true),
            /*SelectMenuWidget(
              hinttext: "¿Cual describe mejor su denuncia?", 
              options: options, 
              selectedOption: selectedOption, 
              onChanged: onChanged, 
              obligatory: obligatory)*/
          ],
        ),
      ),
    );
  }

  void selectAction(String? report) {
    switch(report) {
        case "ROBO DE OBJETOS": _actionOpcions = ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"]; break;
        case "ROBO DE VEHÍCULOS": _actionOpcions = ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"];  break;
        case "ROBO A CASA HABITACIÓN": _actionOpcions = ["CON VIOLENCIA FÍSICA", "CON VIOLENCIA MORAL"];  break;
        case "VIOLENCIA DOMESTICA": break;
        case "LESIONES DOLOSAS": break;
        case "LESIONES CULPOSAS": break;
        
    }
  }
}
