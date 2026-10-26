import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class BenevoLogo extends StatelessWidget {
  final double size;
  final double? borderRadius;
  final bool showShadow;

  const BenevoLogo({
    super.key,
    this.size = 100,
    this.borderRadius,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveRadius = borderRadius ?? (size * 0.22);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFF2B134D),
        borderRadius: BorderRadius.circular(effectiveRadius),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: size * 0.18,
                  offset: Offset(0, size * 0.06),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(effectiveRadius),
        child: Image.asset(
          'assets/images/logo.png',
          width: size,
          height: size,
          fit: BoxFit.contain, // Mempertahankan bentuk asli tanpa perubahan proporsi/stretching
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF2B134D),
              alignment: Alignment.center,
              child: Icon(
                Icons.favorite_rounded,
                color: const Color(0xFFF6E784),
                size: size * 0.5,
              ),
            );
          },
        ),
      ),
    );
  }
}
