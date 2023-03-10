import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:denunciasapp/models/denuncia.dart';
import 'denuncia4.dart';
import 'package:denunciasapp/widgets/subtitlesags.dart';

import '../widgets/text_box.dart';
import 'package:flutter/material.dart';

class Denuncia3 extends StatefulWidget {
  final Map<String, dynamic> datosINE;
  Denuncia3({required this.datosINE});
  @override
  State<StatefulWidget> createState() => _Denuncia3();
}

class _Denuncia3 extends State<Denuncia3> {
  late final _data;

  /*final _datosPrueba = {
    "curp": "momomo",
    "name": {
      "names": "JOSÉ FELIPE",
      "first_last_name": "GONZÁLES",
      "second_last_name": "HERNÁNDEZ"
    },
    "sex": "H", // "H" para hombre y "M" para mujer.
    "birthdate": "24/04/1980",
    "federative_entity": "MX-AGU",
    "domicile": {
      "postal_code": "20468",
      "cologne": "LAS AMÉRICAS",
      "street": "CALLE MAR DE LA PLATA",
      "exterior_number": "224",
      "internal_number": "NA",
      "state": "Aguascalientes",
      "municipality": "Asientos"
    }
  };*/
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
    _data = widget.datosINE;

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
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SubTitlesAgs(texto: "DATOS DEL DENUNCIANTE"),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerCurp1,
                    label: "CURP",
                    defaultText: _data['curp'],
                    onlyText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerNombre1,
                    label: "NOMBRE",
                    defaultText:
                        "${_data['name']['names']} ${_data['name']['first_last_name']} ${_data['name']['second_last_name']} ",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerSexo1,
                    label: "SEXO (H,M)",
                    defaultText: _data['sex'],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerCalle1,
                    label: "CALLE",
                    defaultText: _data['domicile']['street'],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerNoInterior1,
                    label: "NO. INTERIOR",
                    defaultText: _data['domicile']['internal_number'],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerNoExterior1,
                    label: "NO. EXTERIOR",
                    defaultText: _data['domicile']['exterior_number'],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerColonia1,
                    label: "COLONIA",
                    defaultText: _data['domicile']['cologne'],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerMunicipio1,
                    label: "MUNICIPIO",
                    defaultText: _data["domicile"]["municipality"],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                    controller: controllerEstado1,
                    label: "ESTADO",
                    defaultText: _data['federative_entity'],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SubTitlesAgs(texto: "DATOS DEL DENUNCIADO"),
                  SizedBox(height: 50),
                  TextBox(controller: controllerNombre2, label: "NOMBRE", defaultText: "Marco Polo",), //Sólo por motivos de pruebas defaultText
                  SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                  ),
                  TextBox(controller: controllerSexo2, label: "SEXO", defaultText: "Hombre",), //Sólo por motivos de pruebas defaultText
                  SubTitlesAgs(texto: "DOMICILIO DEL DENUNCIADO (OPCIONAL)"),
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(controller: controllerCalle2, label: "CALLE", defaultText: "Venecia Antigua",), //Sólo por motivos de pruebas defaultText
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                      controller: controllerNoInterior2, label: "NO. INTERIOR", defaultText: "1254",), //Sólo por motivos de pruebas defaultText
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(
                      controller: controllerNoExterior2, label: "NO. EXTERIOR", defaultText: "1324",), //Sólo por motivos de pruebas defaultText
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(controller: controllerColonia2, label: "COLONIA", defaultText: "Republica de Venecia",), //Sólo por motivos de pruebas defaultText
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(controller: controllerMunicipio2, label: "MUNICIPIO", defaultText: "Dalmacia",), //Sólo por motivos de pruebas defaultText
                  SizedBox(
                    height: 30,
                  ),
                  TextBox(controller: controllerEstado2, label: "ESTADO", defaultText: "Republica de Marítima",), //Sólo por motivos de pruebas defaultText
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(elevation: 20),
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
                            Denuncia report = Denuncia(
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
                                    builder: (context) =>
                                        Denuncia4(reporte: report)));
                          } else {
                            print("Lo intenté");
                          }
                        },
                        child: const Text("CONTINUAR")),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
