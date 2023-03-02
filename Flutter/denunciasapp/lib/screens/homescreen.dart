import '/screens/denuncia2.dart';
import '/widgets/subtitlesags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Denuncia2()));
                  },
                  child: Text("INICIAR")),
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
