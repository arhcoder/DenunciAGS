import '/screens/homescreen.dart';
import '/widgets/custom_textformfield1.dart';
import '/widgets/subtitlesags.dart';
import 'package:flutter/material.dart';

// Defining a custom Form widget.
class FormularioDenunciante extends StatefulWidget {
  const FormularioDenunciante({super.key});

  FormularioDenuncianteState createState() {
    return FormularioDenuncianteState();
  }
}

// Defining a corresponding State class.
class FormularioDenuncianteState extends State<FormularioDenunciante> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    // Building a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SubTitlesAgs(texto: "DATOS DEL DENUNCIANTE"),
          SizedBox(
            height: 20,
          ),
          CustomTextFormField1(hinttext: "CURP", obligatory: true),
          CustomTextFormField1(hinttext: "NOMBRE", obligatory: true),
          CustomTextFormField1(hinttext: "SEXO", obligatory: true),
          CustomTextFormField1(hinttext: "CALLE", obligatory: true),
          CustomTextFormField1(hinttext: "NO. INTERIOR", obligatory: true),
          CustomTextFormField1(hinttext: "NO. EXTERIOR", obligatory: false),
          CustomTextFormField1(hinttext: "COLONIA", obligatory: true),
          CustomTextFormField1(hinttext: "MUNICIPIO", obligatory: true),
          CustomTextFormField1(hinttext: "ESTADO", obligatory: true),
          SizedBox(
            height: 50,
          ),
          SubTitlesAgs(texto: "DATOS DEL DENUNCIADO"),
          SizedBox(
            height: 50,
          ),
          CustomTextFormField1(hinttext: "NOMBRE", obligatory: true),
          SizedBox(
            height: 50,
          ),
          SubTitlesAgs(texto: "DOMICILIO DEL DENUNCIADO (OPCIONAL)"),
          SizedBox(
            height: 50,
          ),
          CustomTextFormField1(hinttext: "CALLE", obligatory: false),
          CustomTextFormField1(hinttext: "NO. INTERIOR", obligatory: false),
          CustomTextFormField1(hinttext: "NO. EXTERIOR", obligatory: false),
          CustomTextFormField1(hinttext: "COLONIA", obligatory: false),
          CustomTextFormField1(hinttext: "MUNICIPIO", obligatory: false),
          CustomTextFormField1(hinttext: "ESTADO", obligatory: false),
          SizedBox(
            height: 50,
          ),
          // Add TextFormFields and ElevatedButton here.
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: ElevatedButton(
              onPressed: () {
                //holi
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cargando')),
                  );
                }
              },
              child: const Text('CONTINUAR'),
            ),
          ),
        ],
      ),
    );
  }
}
