import 'package:flutter/material.dart';

class CustomTextFormField1 extends StatelessWidget {
  final String hinttext;
  final bool obligatory;
  const CustomTextFormField1({
    required this.obligatory,
    required this.hinttext,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: new InputDecoration(hintText: hinttext),
          // passing the user entered text to validator
          validator: (value) {
            if (obligatory) {
              if (value == null || value.isEmpty) {
                return 'Este campo es necesario';
              }
            }
            return null;
          },
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
