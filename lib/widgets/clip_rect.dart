import 'dart:math';

import 'package:flutter/material.dart';

Widget clipRectDemo() {
  return ClipPath(
    clipper: CustomCliper1(),
    child: Container(
      height: 200,
      width: 200,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
    ),
  );
}

class CustomCliper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Constants
    final birdWidth = size.width * 0.6;
    final birdHeight = size.height * 0.4;
    final bodyHeight = birdHeight * 0.6;
    final wingHeight = birdHeight * 0.4;
    final wingWidth = birdWidth * 0.4;
    final headRadius = birdHeight * 0.2;

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

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
