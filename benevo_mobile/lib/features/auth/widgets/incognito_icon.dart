import 'package:flutter/material.dart';

/// A custom drawn incognito/anonymous icon (fedora hat and round glasses).
class IncognitoIcon extends StatelessWidget {
  final double size;
  final Color color;

  const IncognitoIcon({
    super.key,
    this.size = 24,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size * 0.9),
      painter: _IncognitoPainter(color: color),
    );
  }
}

class _IncognitoPainter extends CustomPainter {
  final Color color;

  _IncognitoPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.08
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final w = size.width;
    final h = size.height;

    // 1. Hat Crown (Upper part)
    final crownPath = Path();
    crownPath.moveTo(w * 0.30, h * 0.44);
    crownPath.lineTo(w * 0.33, h * 0.16);
    // top crease
    crownPath.quadraticBezierTo(w * 0.50, h * 0.22, w * 0.67, h * 0.16);
    crownPath.lineTo(w * 0.70, h * 0.44);
    canvas.drawPath(crownPath, strokePaint);

    // Hat ribbon / band line
    canvas.drawLine(
      Offset(w * 0.305, h * 0.38),
      Offset(w * 0.695, h * 0.38),
      strokePaint..strokeWidth = size.width * 0.06,
    );

    // 2. Hat Brim (Wide curved bottom)
    final brimPath = Path();
    brimPath.moveTo(w * 0.12, h * 0.48);
    brimPath.quadraticBezierTo(w * 0.50, h * 0.40, w * 0.88, h * 0.48);
    canvas.drawPath(brimPath, strokePaint..strokeWidth = size.width * 0.085);

    // 3. Round Glasses
    final glassRadius = w * 0.13;
    final leftCenter = Offset(w * 0.34, h * 0.72);
    final rightCenter = Offset(w * 0.66, h * 0.72);

    // Left lens
    canvas.drawCircle(leftCenter, glassRadius, strokePaint..strokeWidth = size.width * 0.075);
    // Right lens
    canvas.drawCircle(rightCenter, glassRadius, strokePaint);

    // Glasses bridge
    final bridgePath = Path();
    bridgePath.moveTo(w * 0.46, h * 0.70);
    bridgePath.quadraticBezierTo(w * 0.50, h * 0.65, w * 0.54, h * 0.70);
    canvas.drawPath(bridgePath, strokePaint..strokeWidth = size.width * 0.07);
  }

  @override
  bool shouldRepaint(covariant _IncognitoPainter oldDelegate) =>
      oldDelegate.color != color;
}
