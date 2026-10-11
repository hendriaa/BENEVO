import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A cleanly rendered official 4-color Google "G" logo using CustomPainter.
class GoogleLogo extends StatelessWidget {
  final double size;

  const GoogleLogo({
    super.key,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _GoogleLogoPainter(),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final strokeWidth = size.width * 0.22;

    final rect = Rect.fromCircle(center: center, radius: radius - strokeWidth / 2);

    final paintRed = Paint()
      ..color = const Color(0xFFEA4335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final paintYellow = Paint()
      ..color = const Color(0xFFFBBC05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final paintGreen = Paint()
      ..color = const Color(0xFF34A853)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    final paintBlue = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    // Google G arcs:
    // Red (top arc): roughly -140 deg to -40 deg
    canvas.drawArc(rect, -math.pi * 0.78, math.pi * 0.56, false, paintRed);

    // Yellow (left arc): roughly -220 deg to -140 deg
    canvas.drawArc(rect, -math.pi * 1.22, math.pi * 0.44, false, paintYellow);

    // Green (bottom arc): roughly -300 deg to -220 deg
    canvas.drawArc(rect, -math.pi * 1.78, math.pi * 0.56, false, paintGreen);

    // Blue (right arc): roughly 0 to -40 deg
    canvas.drawArc(rect, -math.pi * 0.22, math.pi * 0.44, false, paintBlue);

    // Blue horizontal bar in the middle
    final barPaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.fill;

    final barHeight = strokeWidth;
    final barWidth = radius * 0.95;
    final barRect = Rect.fromLTWH(
      center.dx - radius * 0.05,
      center.dy - barHeight / 2,
      barWidth,
      barHeight,
    );
    canvas.drawRect(barRect, barPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
