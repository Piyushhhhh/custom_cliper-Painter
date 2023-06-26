import 'dart:math';

import 'package:flutter/material.dart';

class SunflowerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final birdWidth = size.width * 0.6;
    final birdHeight = size.height * 0.4;
    final bodyHeight = birdHeight * 0.6;
    final wingHeight = birdHeight * 0.4;
    final wingWidth = birdWidth * 0.4;
    final headRadius = birdHeight * 0.2;

    final paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final path = Path();

    // Starting point
    path.moveTo(0, bodyHeight);

    // Body
    path.quadraticBezierTo(
        birdWidth * 0.3, bodyHeight - birdHeight * 0.1, birdWidth, bodyHeight);

    // Tail
    path.lineTo(birdWidth - wingWidth, bodyHeight + wingHeight);
    path.lineTo(birdWidth, bodyHeight + birdHeight * 0.5);

    // Head
    path.addArc(
        Rect.fromCircle(
            center: Offset(birdWidth + headRadius, bodyHeight - headRadius),
            radius: headRadius),
        -pi / 2,
        pi);

    // Wing
    path.lineTo(birdWidth - wingWidth, bodyHeight - wingHeight);

    // Close the path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SunflowerPainter oldDelegate) => false;
}
