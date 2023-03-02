import 'package:denunciasapp/models/denuncia.dart';
import 'package:denunciasapp/screens/denuncia4.dart';
import 'package:denunciasapp/widgets/subtitlesags.dart';

import '../widgets/text_box.dart';
import 'package:flutter/material.dart';

class CitzenReport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CitzenReport();
}

class _CitzenReport extends State<CitzenReport> {
  //DATOS DENUNCIANTE

  late TextEditingController controllerCurp1;
  late TextEditingController controllerNombre1;
  late TextEditingController controllerSexo1;
  late TextEditingController controllerCalle1;
  late TextEditingController controllerNoInterior1;
  late TextEditingController controllerNoExterior1;
  late TextEditingController controllerColonia1;
  late TextEditingController controllerMunicipio1;
  late TextEditingController controllerEstado1;
  //DATOS DENUNCIADO
  late TextEditingController controllerCurp2;
  late TextEditingController controllerNombre2;
  late TextEditingController controllerSexo2;
  late TextEditingController controllerCalle2;
  late TextEditingController controllerNoInterior2;
  late TextEditingController controllerNoExterior2;
  late TextEditingController controllerColonia2;
  late TextEditingController controllerMunicipio2;
  late TextEditingController controllerEstado2;
  //DATOS DENUNCIA
  late TextEditingController controllerTipo;
  late TextEditingController controllerDescripcionTipo;
  late TextEditingController controllerFecha;
  late TextEditingController controllerHora;
  late TextEditingController controllerCalleHechos;
  late TextEditingController controllerEntreCalleHechos;
  late TextEditingController controllerUbicacionActualHechos;
  late TextEditingController controllerNarrativaDenuncia;
  late TextEditingController controllerTestigos;
  late TextEditingController controllerImagePath;
  late TextEditingController controllerAnonima;
  late TextEditingController controllerTelefonoDenunciante;
  late TextEditingController controllerCorreoDenunciante;

//OBJETO REPORTE
  @override
  void initState() {
    controllerCurp1 = new TextEditingController();
    controllerNombre1 = new TextEditingController();
    controllerSexo1 = new TextEditingController();
    controllerCalle1 = new TextEditingController();
    controllerNoInterior1 = new TextEditingController();
    controllerNoExterior1 = new TextEditingController();
    controllerColonia1 = new TextEditingController();
    controllerMunicipio1 = new TextEditingController();
    controllerEstado1 = new TextEditingController();
    //DATOS DENUNCIADO
    controllerCurp2 = new TextEditingController();
    controllerNombre2 = new TextEditingController();
    controllerSexo2 = new TextEditingController();
    controllerCalle2 = new TextEditingController();
    controllerNoInterior2 = new TextEditingController();
    controllerNoExterior2 = new TextEditingController();
    controllerColonia2 = new TextEditingController();
    controllerMunicipio2 = new TextEditingController();
    controllerEstado2 = new TextEditingController();
    //DATOS DENUNCIA
    controllerTipo = new TextEditingController();
    controllerDescripcionTipo = new TextEditingController();
    controllerFecha = new TextEditingController();
    controllerHora = new TextEditingController();
    controllerCalleHechos = new TextEditingController();
    controllerEntreCalleHechos = new TextEditingController();
    controllerUbicacionActualHechos = new TextEditingController();
    controllerNarrativaDenuncia = new TextEditingController();
    controllerTestigos = new TextEditingController();
    controllerImagePath = new TextEditingController();
    controllerAnonima = new TextEditingController();
    controllerTelefonoDenunciante = new TextEditingController();
    controllerCorreoDenunciante = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          SubTitlesAgs(texto: "DATOS DEL DENUNCIANTE"),
          SizedBox(
            height: 20,
          ),
          TextBox(controllerCurp1, "CURP"),
          TextBox(controllerNombre1, "NOMBRE"),
          TextBox(controllerSexo1, "SEXO"),
          TextBox(controllerCalle1, "CALLE"),
          TextBox(controllerNoInterior1, "NO. INTERIOR"),
          TextBox(controllerNoExterior1, "NO. EXTERIOR"),
          TextBox(controllerColonia1, "COLONIA"),
          TextBox(controllerMunicipio1, "MUNICIPIO"),
          TextBox(controllerEstado1, "ESTADO"),
          SizedBox(
            height: 50,
          ),
          SubTitlesAgs(texto: "DATOS DEL DENUNCIADO"),
          SizedBox(height: 50),
          TextBox(controllerNombre2, "NOMBRE"),
          SizedBox(height: 50),
          SubTitlesAgs(texto: "DOMICILIO DEL DENUNCIADO (OPCIONAL)"),
          SizedBox(
            height: 50,
          ),
          TextBox(controllerSexo2, "SEXO"),
          TextBox(controllerCalle2, "CALLE"),
          TextBox(controllerNoInterior2, "NO. INTERIOR"),
          TextBox(controllerNoExterior2, "NO. EXTERIOR"),
          TextBox(controllerColonia2, "COLONIA"),
          TextBox(controllerMunicipio2, "MUNICIPIO"),
          TextBox(controllerEstado2, "ESTADO"),
          Container(
            height: 80,
            child: ElevatedButton(
                onPressed: () {
                  if (controllerCurp1.text.isNotEmpty &&
                      controllerNombre1.text.isNotEmpty &&
                      controllerSexo1.text.isNotEmpty &&
                      controllerCalle1.text.isNotEmpty &&
                      controllerNoInterior1.text.isNotEmpty &&
                      controllerNoExterior1.text.isNotEmpty &&
                      controllerColonia1.text.isNotEmpty &&
                      controllerMunicipio1.text.isNotEmpty &&
                      controllerEstado1.text.isNotEmpty &&
                      controllerNombre2.text.isNotEmpty) {
                    var report = Denuncia(
                        curp1: controllerNombre1.text,
                        nombre1: controllerNombre1.text,
                        sexo1: controllerSexo1.text,
                        calle1: controllerCalle1.text,
                        nointerior1: controllerNoInterior1.text,
                        noexterior1: controllerNoExterior1.text,
                        colonia1: controllerColonia1.text,
                        municipio1: controllerMunicipio1.text,
                        estado1: controllerEstado1.text,
                        //DENUNCIADO
                        nombre2: controllerAnonima.text,
                        sexo2: controllerSexo2.text,
                        calle2: controllerCalle2.text,
                        nointerior2: controllerNoInterior2.text,
                        noexterior2: controllerNoExterior2.text,
                        colonia2: controllerColonia2.text,
                        municipio2: controllerMunicipio2.text,
                        estado2: controllerEstado2.text,
                        anonima: false);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Denuncia4(
                                  denuncia: report,
                                )));
                  } else {
                    print("Lo intenté");
                  }
                },
                child: const Text("CONTINUAR")),
          ),
        ],
      ),
    ));
  }
}
