import 'package:flutter/material.dart';

class SignaturePainter extends CustomPainter {
  final List<Offset?> points;
  SignaturePainter({required this.points});
  

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    Paint paint = new Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

    for(int i = 0; i < points.length-1 ; i++) {
      if(points[i] != null && points[i+1] != null) {
        canvas.drawLine(points[i]!, points[i+1]!, paint);
      }
    }
  }
  
  @override
  bool shouldRepaint(SignaturePainter other) => other.points != points;

}