import 'package:flutter/material.dart';
import 'package:denuncias/widgets/subtitlesags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Denuncia2 extends StatelessWidget {
  const Denuncia2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 1,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TitlesAgs(texto: "DENUNCIAS AL ALCANCE DE TODOS"),
                SizedBox(height: 20),
                SubTitlesAgs(texto: "FRENTE DE LA IDENTIFICACIÓN OFICIAL"),
                //AQUÍ POSICIONAR LA CARGA DE FOTOGRAFÍA DE LA INE PARTE FRONTAL
                SizedBox(
                  height: 20,
                ),
                Padding(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.withOpacity(0.2)),
                        onPressed: () => {},
                        child: Icon(
                          Icons.upload,
                          size: 180,
                        )),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                SubTitlesAgs(texto: "REVERSO DE LA IDENTIFICACIÓN OFICIAL"),
                //AQUÍ POSICIONAMOS LA CARGA DE FOTOGRAFÍA DE LA INE PARTE TRASERA
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.indigo.withOpacity(0.2)),
                        onPressed: () => {},
                        child: Icon(
                          Icons.upload,
                          size: 180,
                        )),
                  ),
                  padding: EdgeInsets.only(left: 20, right: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    //ACCIÓN AL PRESIONAR
                    onPressed: () => {},
                    child: const Text("CONTINUAR"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
