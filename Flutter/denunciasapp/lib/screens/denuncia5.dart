import 'package:denunciasapp/models/denuncia.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_form_widget1.dart';
import '../widgets/subtitlesags.dart';
import '../widgets/titlesags.dart';

class Denuncia5 extends StatelessWidget {
  const Denuncia5({Key? key}) : super(key: key);
//AQUÍ TENEMOS QUE HACER EL REQUEST DEL NUMERO DE SEGUIMIENTO
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ULTIMOS PASOS"),
        backgroundColor: Color.fromARGB(255, 44, 41, 115),
      ),
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                const TitlesAgs(texto: "GRACIAS POR REALIZAR TU DENUNCIA"),
                SizedBox(
                  height: 40,
                ),
                //AQUÍ VA EL NUMERO DE SEGUIMIENTO
                SizedBox(
                  height: 40,
                ),
                SubTitlesAgs(texto: "ESTE ES TU NUMERO DE SEGUIMIENTO"),
                SizedBox(
                  height: 50,
                ),

                Container(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      //SI LO PRESIONA, SE VA A CONSULTAR EL ESTADO DE LA DENUNCIA
                    },
                    child: Text(
                      "CONSULTAR ESTADO",
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  "FAVOR DE LLAMAR AL 449-####### O ACUDIR DIRECTAMENTE A LAS OFICINASPARA CONFIRMAR SU DENUNCIA CON EL NUMERO DE SEGUIMIENTO",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "SI ESTE PASO NO SE REALIZA DENTRO DE LOS PROXIMOS 15 DÍAS, SU DENUNCIA SERÁ DESCARTADA Y TENDRÁ QUE REALIZARLA DE NUEVO",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
