import 'package:flutter/material.dart';
import '../models/denuncia.dart';
import '../widgets/widgets.dart';

class Denuncia4 extends StatelessWidget {
  final Denuncia denuncia;
  const Denuncia4({Key? key, required this.denuncia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormularioDenunciante();
  }
}
