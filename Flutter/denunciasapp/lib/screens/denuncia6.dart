import 'dart:convert';
import 'package:denunciasapp/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/titlesags.dart';

class Denuncia6 extends StatefulWidget {
  const Denuncia6({super.key});

  @override
  _Denuncia6 createState() => _Denuncia6();
}

class _Denuncia6 extends State<Denuncia6> {
  late Map<String, dynamic> data;
  @override
  void initState() {
    data = {
      "nombre": "EMILIO LUNA",
      "curp": "LUPE030230HASRNANMA7",
      "estatus": "EN ESPERA",
      "respuesta": null,
      "descripcion":
          "Los genoveses y los venecianos comenzaron a asesinarse entre ellos con armas punzo cortantes",
      "numSeguimiento": null,
      "accion_denuncia": null,
      "fecha_hechos": "29/02/2021",
      "hora_hechos": "25:61",
      "lugar_hechos": " ll Milione,",
      "testigos": null,
      "denuncia_anonima": false,
      "telefono_denunciante": null,
      "correo_denunciante": null,
      "firma": null,
      "tipodenuncia": "ROBO CON VIOLENCIA",
      "nombredenunciado": "Marco Polo",
      "calle_denuncia": null,
      "entreCalleUno_denuncia": null,
      "entreCalleDos_denuncia": null,
      "municipio_denunciado": null,
      "codigoPostal_denunciado": null,
      "colonia_denunciado": null,
      "calle_denunciado": null,
      "numExterior_denunciado": null,
      "numInterior_denunciado": null,
      "municipio_denunciador": null,
      "codigoPostal_denunciador": null,
      "colonia_denunciador": null,
      "calle_denunciador": null,
      "numExterior_denunciador": null,
      "numInterior_denunciador": null,
      "denuncia_images": []
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ESTADO DE LA DENUNCIA"),
          backgroundColor: Color.fromARGB(255, 44, 41, 115),
        ),
        body: Card(
          child: ListTile(
            title: TitlesAgs(
                texto: "DENUNCIA POR: ${data["tipodenuncia"]}" ??
                    "NO APARECE DELITO"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "ESTATUS: ${data["estatus"] ?? "No disponible"}",
                    style: TextStyle(fontSize: 18.0, color: Colors.orange),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "DENUNCIANTE: ${data["nombre"] ?? "No disponible"}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "DENUNCIADO: ${data["nombredenunciado"] ?? "No disponible"}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "FECHA DE LOS HECHOS: ${data["fecha_hechos"] ?? "No disponible"}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "HORA DE LOS HECHOS: ${data["hora_hechos"] ?? "No disponible"}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "LUGAR DE LOS HECHOS: ${data["lugar_hechos"] ?? "No disponible"}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "NARRATIVA: ${data["descripcion"] ?? "No disponible"}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 20),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text(
                        "REGRESAR",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
