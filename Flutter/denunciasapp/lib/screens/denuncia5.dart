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
        title: Text("BIENVENIDO"),
        backgroundColor: Color.fromARGB(255, 44, 41, 115),
      ),
      body: SingleChildScrollView(
        child: Center(
          heightFactor: 1,
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/ags.png'),
                width: 350,
                height: 150,
              ),

              TitlesAgs(
                texto: "SELECCIONE EL TIPO DE TRAMITE QUE DESEA HACER",
              ),
              SizedBox(height: 50),
              SubTitlesAgs(texto: "REALIZAR DENUNCIA"),
              SizedBox(height: 50),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      /*
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Consulta()),);*/
                    },
                    child: Text("INICIAR")),
              ),
              //SECCIÓN DE SEGUIMIENTO DE DENUNCIA
              SizedBox(height: 50),
              SubTitlesAgs(texto: "CONSULTAR UNA DENUNCIA"),
              SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: Column(
                  children: [
                    CustomForm1(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
