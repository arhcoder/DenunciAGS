import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Denuncia3 extends StatelessWidget {
  const Denuncia3({Key? key}) : super(key: key);

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
                FormularioDenunciante()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
