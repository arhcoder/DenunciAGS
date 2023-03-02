import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'MySignaturePainter.dart';

class Signature extends StatefulWidget {
  final Size cardSize;

  Signature({Key? key, required this.cardSize}) : super(key: key);

  @override
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset?> _points = <Offset?>[];

  ui.Image? _image;

  void _onPanUpdate(DragUpdateDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localPosition = renderBox.globalToLocal(details.globalPosition);
    if (localPosition.dx >= 0 &&
        localPosition.dx <= widget.cardSize.width &&
        localPosition.dy >= 0 &&
        localPosition.dy <= widget.cardSize.height - 50) {
      setState(() {
        _points = List.from(_points)..add(localPosition);
      });
    }
  }

  void _onPanEnd(DragEndDetails details) async {
    _image = await _getImage();
    _points.add(null);
    // Aquí puedes guardar la imagen en un archivo o enviarla a un servidor.
  }

  void _clean() {
    _points.clear();
  }

  Future<ui.Image> _getImage() async {
    RenderRepaintBoundary boundary =
        context.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    return image;
  }

  Future<ui.Image?> getImage() async {
    if (_image != null) {
      return _image!;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        children: [
          GestureDetector(
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: CustomPaint(
              painter: SignaturePainter(points: _points),
              size: widget.cardSize,
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: _clean,
              child: const Text("Limpiar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: ui.Color.fromARGB(0, 231, 15, 156),
              ),
              ),
          ),
        ],
      ),
    );
  }
}
