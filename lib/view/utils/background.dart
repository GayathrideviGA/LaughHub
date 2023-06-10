import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/view/utils/constants.dart';

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the rectangle to be painted
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Define the background gradient
    final Gradient gradient = AppGradients.backgroundGradient;

    // Create a paint object with the gradient shader
    final Paint paint = Paint()..shader = gradient.createShader(rect);

    // Draw the background rectangle
    canvas.drawRect(rect, paint);

    final random = Random();

    // Draw random circles on the canvas
    for (int i = 0; i < 10; i++) {
      // Generate random coordinates and radius for the circle
      final centerX = random.nextDouble() * size.width;
      final centerY = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 50 + 10;

      // Get a random circle gradient
      final Gradient circleGradient = AppGradients.randomCircleGradient;

      // Create a paint object with the circle gradient shader
      final circlePaint = Paint()
        ..shader = circleGradient.createShader(
            Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

      // Draw the circle on the canvas
      canvas.drawCircle(Offset(centerX, centerY), radius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // We don't need to repaint the background, as it is static
    return false;
  }
}
