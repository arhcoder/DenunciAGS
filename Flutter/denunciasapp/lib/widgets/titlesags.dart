import 'package:flutter/material.dart';

class TitlesAgs extends StatelessWidget {
  const TitlesAgs({Key? key, required this.texto}) : super(key: key);
  final String texto;
  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(51, 54, 140, 1)),
      textAlign: TextAlign.center,
    );
  }
}
