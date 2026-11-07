import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class BenevoLogo extends StatelessWidget {
  final double size;

  const BenevoLogo({
    super.key,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        borderRadius: BorderRadius.circular(size * 0.26),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: CustomPaint(
          size: Size(size * 0.72, size * 0.72),
          painter: _BenevoLogoPainter(),
        ),
      ),
    );
  }
}

class _BenevoLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.32;

    // Petals / Overlapping translucent circles
    final petalPaint = Paint()
      ..color = const Color(0xFF8B67B8).withValues(alpha: 0.55)
      ..style = PaintingStyle.fill;

    // 4 overlapping circular petals (Top, Bottom, Left, Right)
    final offsetDistance = radius * 0.45;
    canvas.drawCircle(Offset(center.dx, center.dy - offsetDistance), radius, petalPaint);
    canvas.drawCircle(Offset(center.dx, center.dy + offsetDistance), radius, petalPaint);
    canvas.drawCircle(Offset(center.dx - offsetDistance, center.dy), radius, petalPaint);
    canvas.drawCircle(Offset(center.dx + offsetDistance, center.dy), radius, petalPaint);

    // Center lighter glow petal / halo
    final centerGlowPaint = Paint()
      ..color = const Color(0xFFA889D4).withValues(alpha: 0.4)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.8, centerGlowPaint);

    // Heart Badge Background / Inner shape
    final innerBadgePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final badgeRadius = radius * 0.46;
    final badgeCenter = Offset(center.dx, center.dy - 2);
    canvas.drawCircle(badgeCenter, badgeRadius, innerBadgePaint);

    // Draw little yellow heart in center
    _drawHeart(canvas, badgeCenter, badgeRadius * 0.75, const Color(0xFFF9E47A));

    // Bottom white droplet
    final dropPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    
    final dropCenter = Offset(center.dx, center.dy + badgeRadius + 7);
    canvas.drawCircle(dropCenter, 3.2, dropPaint);
  }

  void _drawHeart(Canvas canvas, Offset center, double size, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final width = size;
    final height = size * 0.9;
    final left = center.dx - width / 2;
    final top = center.dy - height / 2;

    path.moveTo(left + width / 2, top + height * 0.35);
    // Left curve
    path.cubicTo(
      left + width * 0.15, top - height * 0.15,
      left - width * 0.1, top + height * 0.45,
      left + width / 2, top + height,
    );
    // Right curve
    path.cubicTo(
      left + width * 1.1, top + height * 0.45,
      left + width * 0.85, top - height * 0.15,
      left + width / 2, top + height * 0.35,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
