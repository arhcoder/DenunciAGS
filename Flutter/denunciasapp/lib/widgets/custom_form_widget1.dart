import 'package:flutter/material.dart';

import '../screens/homescreen.dart';

// Defining a custom Form widget.
class CustomForm1 extends StatefulWidget {
  const CustomForm1({super.key});

  CustomForm1State createState() {
    return CustomForm1State();
  }
}

// Defining a corresponding State class.
class CustomForm1State extends State<CustomForm1> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    // Building a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            // passing the user entered text to validator
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese un valor valido';
              }
              return null;
            },
          ),
          SizedBox(
            height: 40,
          ),
          // Add TextFormFields and ElevatedButton here.

          Container(
            height: 50,
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(elevation: 20),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen())); //aquí va la pantalla de estado de la denuncia
                }
              },
              child: const Text(
                "CONSULTAR",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
