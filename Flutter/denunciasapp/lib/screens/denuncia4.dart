import 'package:flutter/material.dart';
import '../models/denuncia.dart';
import '../widgets/widgets.dart';

class Denuncia4 extends StatelessWidget {
  Denuncia denuncia;
  Denuncia4({Key? key, required this.denuncia}) : super(key: key);

  final List<String> reportOption = [
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
  ];
  final String selectedOption = "ROBO DE OBJETOS";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 50),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                SelectMenuWidget(
                    options: reportOption,
                    selectedOption: selectedOption,
                    onChanged: (value) {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
