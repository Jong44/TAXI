import 'package:flutter/material.dart';

class Segitiga extends CustomPainter {
  final Color color;

  Segitiga({this.color = Colors.green});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(size.width / 2, 0); // Posisi atas segitiga
    path.lineTo(size.width, size.height); // Posisi kanan bawah segitiga
    path.lineTo(0, size.height); // Posisi kiri bawah segitiga
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
