import 'package:flutter/material.dart';

class SubTitlesAgs extends StatelessWidget {
  const SubTitlesAgs({Key? key, required this.texto}) : super(key: key);
  final String texto;
  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(35, 81, 140, 1)),
      textAlign: TextAlign.center,
    );
  }
}
