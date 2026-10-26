import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

/// Custom Bottom Navigation Bar matching the Benevo curved design
/// with animated circular dome indicator and bespoke brand icons.
class BenevoBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BenevoBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BenevoBottomNavBar> createState() => _BenevoBottomNavBarState();
}

class _BenevoBottomNavBarState extends State<BenevoBottomNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animPosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 320),
    );
    _animPosition = Tween<double>(
      begin: widget.currentIndex.toDouble(),
      end: widget.currentIndex.toDouble(),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant BenevoBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      final from = _animPosition.value;
      final to = widget.currentIndex.toDouble();
      _controller.reset();
      _animPosition = Tween<double>(begin: from, end: to).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOutCubic,
        ),
      );
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    const double barHeight = 64.0;
    const double totalHeight = barHeight + 16.0; // 16px dome rise

    return Container(
      color: Colors.transparent,
      height: totalHeight + bottomPadding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 1. Curved White Background with animated dome
          AnimatedBuilder(
            animation: _animPosition,
            builder: (context, _) {
              return CustomPaint(
                size: Size(MediaQuery.of(context).size.width, totalHeight + bottomPadding),
                painter: _BenevoNavBarPainter(
                  itemCount: 5,
                  currentPosition: _animPosition.value,
                  barTop: 16.0,
                  domeRise: 16.0,
                  domeHalfWidth: 38.0,
                  shadowColor: AppColors.primary.withValues(alpha: 0.14),
                ),
              );
            },
          ),

          // 2. Active Tab Purple Circle with Lavender Border
          AnimatedBuilder(
            animation: _animPosition,
            builder: (context, _) {
              final screenWidth = MediaQuery.of(context).size.width;
              final itemWidth = screenWidth / 5;
              final activeCenterX = (itemWidth * _animPosition.value) + (itemWidth / 2);

              return Positioned(
                left: activeCenterX - 25.0,
                top: 2.0,
                child: IgnorePointer(
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFEADBFA),
                        width: 3.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.32),
                          blurRadius: 10.0,
                          offset: const Offset(0, 4.0),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // 3. Navigation Items Row
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: totalHeight,
            child: Row(
              children: [
                _buildTabItem(
                  index: 0,
                  icon: BenevoHomeIcon(
                    color: widget.currentIndex == 0 ? Colors.white : AppColors.primary,
                  ),
                ),
                _buildTabItem(
                  index: 1,
                  icon: BenevoDonationIcon(
                    color: widget.currentIndex == 1 ? Colors.white : AppColors.primary,
                  ),
                ),
                _buildTabItem(
                  index: 2,
                  icon: BenevoHistoryIcon(
                    color: widget.currentIndex == 2 ? Colors.white : AppColors.primary,
                  ),
                ),
                _buildTabItem(
                  index: 3,
                  icon: BenevoHeartNavIcon(
                    color: widget.currentIndex == 3 ? Colors.white : AppColors.primary,
                  ),
                ),
                _buildTabItem(
                  index: 4,
                  icon: BenevoProfileIcon(
                    color: widget.currentIndex == 4 ? Colors.white : AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required int index,
    required Widget icon,
  }) {
    final isSelected = widget.currentIndex == index;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => widget.onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.only(
            top: isSelected ? 12.0 : 28.0,
          ),
          alignment: Alignment.topCenter,
          child: icon,
        ),
      ),
    );
  }
}

/// Custom painter that draws the white navigation bar with an upward circular dome
/// and soft drop shadow.
class _BenevoNavBarPainter extends CustomPainter {
  final int itemCount;
  final double currentPosition;
  final double barTop;
  final double domeRise;
  final double domeHalfWidth;
  final Color shadowColor;

  _BenevoNavBarPainter({
    required this.itemCount,
    required this.currentPosition,
    required this.barTop,
    required this.domeRise,
    required this.domeHalfWidth,
    required this.shadowColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final itemWidth = size.width / itemCount;
    final activeX = (itemWidth * currentPosition) + (itemWidth / 2);

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, barTop);

    final leftDome = activeX - domeHalfWidth;
    final rightDome = activeX + domeHalfWidth;
    final peakY = barTop - domeRise;

    // Line to start of dome
    path.lineTo(leftDome.clamp(0.0, size.width), barTop);

    // Smooth cubic bezier up to dome peak
    path.cubicTo(
      activeX - (domeHalfWidth * 0.52), barTop,
      activeX - (domeHalfWidth * 0.44), peakY,
      activeX, peakY,
    );

    // Smooth cubic bezier down from dome peak
    path.cubicTo(
      activeX + (domeHalfWidth * 0.44), peakY,
      activeX + (domeHalfWidth * 0.52), barTop,
      rightDome.clamp(0.0, size.width), barTop,
    );

    // Line to right edge and close
    path.lineTo(size.width, barTop);
    path.lineTo(size.width, size.height);
    path.close();

    // 1. Shadow Paint
    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12.0);
    canvas.drawPath(path.shift(const Offset(0, -3.0)), shadowPaint);

    // 2. White Fill
    final fillPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _BenevoNavBarPainter oldDelegate) {
    return oldDelegate.currentPosition != currentPosition ||
        oldDelegate.shadowColor != shadowColor;
  }
}

// ============================================================================
// CUSTOM BESPOKE ICONS MATCHING THE DESIGN
// ============================================================================

/// 1. Home Icon with heart cutout and chimney on the right side
class BenevoHomeIcon extends StatelessWidget {
  final double size;
  final Color color;

  const BenevoHomeIcon({
    super.key,
    this.size = 28.0,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HomeHeartPainter(color: color),
    );
  }
}

class _HomeHeartPainter extends CustomPainter {
  final Color color;

  _HomeHeartPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Chimney on right slope of roof
    final chimneyPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(w * 0.67, h * 0.13, w * 0.11, h * 0.22),
          const Radius.circular(1.5),
        ),
      );

    // Roof & house main structure
    final housePath = Path();
    housePath.moveTo(w * 0.50, h * 0.14); // peak
    housePath.lineTo(w * 0.90, h * 0.44); // right eave tip
    housePath.lineTo(w * 0.81, h * 0.44); // right eave inset
    housePath.lineTo(w * 0.81, h * 0.86); // right wall bottom
    housePath.lineTo(w * 0.19, h * 0.86); // left wall bottom
    housePath.lineTo(w * 0.19, h * 0.44); // left eave inset
    housePath.lineTo(w * 0.10, h * 0.44); // left eave tip
    housePath.close();

    final houseWithChimney = Path.combine(PathOperation.union, housePath, chimneyPath);

    // Heart Cutout in the center of the house
    final heartPath = _buildHeartPath(
      centerX: w * 0.50,
      centerY: h * 0.64,
      width: w * 0.30,
      height: h * 0.28,
    );

    final finalPath = Path.combine(PathOperation.difference, houseWithChimney, heartPath);
    canvas.drawPath(finalPath, paint);
  }

  static Path _buildHeartPath({
    required double centerX,
    required double centerY,
    required double width,
    required double height,
  }) {
    final path = Path();
    final w = width;
    final h = height;
    final top = centerY - (h / 2);
    final bottom = centerY + (h / 2);

    path.moveTo(centerX, top + h * 0.26);
    // Left lobe
    path.cubicTo(
      centerX - w * 0.08, top,
      centerX - w * 0.52, top,
      centerX - w * 0.52, top + h * 0.38,
    );
    path.cubicTo(
      centerX - w * 0.52, top + h * 0.66,
      centerX - w * 0.16, top + h * 0.80,
      centerX, bottom,
    );
    // Right lobe
    path.cubicTo(
      centerX + w * 0.16, top + h * 0.80,
      centerX + w * 0.52, top + h * 0.66,
      centerX + w * 0.52, top + h * 0.38,
    );
    path.cubicTo(
      centerX + w * 0.52, top,
      centerX + w * 0.08, top,
      centerX, top + h * 0.26,
    );
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _HomeHeartPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// 2. Hand Holding Donation Bag with Heart
class BenevoDonationIcon extends StatelessWidget {
  final double size;
  final Color color;

  const BenevoDonationIcon({
    super.key,
    this.size = 28.0,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size * (28.0 / 30.0)),
      painter: _DonationBagHandPainter(color: color),
    );
  }
}

class _DonationBagHandPainter extends CustomPainter {
  final Color color;

  _DonationBagHandPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // 1. Ruffled knot at top of money bag
    final knotPath = Path();
    knotPath.moveTo(w * 0.52, 0);
    knotPath.lineTo(w * 0.75, 0);
    knotPath.quadraticBezierTo(w * 0.72, h * 0.09, w * 0.69, h * 0.12);
    knotPath.lineTo(w * 0.58, h * 0.12);
    knotPath.quadraticBezierTo(w * 0.55, h * 0.09, w * 0.52, 0);
    knotPath.close();

    // 2. Money bag body
    final bagPath = Path();
    bagPath.moveTo(w * 0.54, h * 0.15);
    bagPath.lineTo(w * 0.73, h * 0.15);
    bagPath.cubicTo(
      w * 0.82, h * 0.20,
      w * 0.92, h * 0.32,
      w * 0.91, h * 0.48,
    );
    bagPath.cubicTo(
      w * 0.90, h * 0.60,
      w * 0.78, h * 0.64,
      w * 0.72, h * 0.63,
    );
    bagPath.cubicTo(
      w * 0.60, h * 0.54,
      w * 0.43, h * 0.51,
      w * 0.37, h * 0.46,
    );
    bagPath.cubicTo(
      w * 0.35, h * 0.36,
      w * 0.42, h * 0.22,
      w * 0.54, h * 0.15,
    );
    bagPath.close();

    // 3. Heart cutout on the bag
    final heartPath = _HomeHeartPainter._buildHeartPath(
      centerX: w * 0.65,
      centerY: h * 0.38,
      width: w * 0.20,
      height: h * 0.18,
    );

    final bagWithHeart = Path.combine(PathOperation.difference, bagPath, heartPath);

    // 4. Hand holding the bag
    final handPath = Path();
    handPath.moveTo(w * 0.11, h * 0.64);
    // Upper contour of thumb extending rightwards under the bag
    handPath.cubicTo(
      w * 0.18, h * 0.55,
      w * 0.34, h * 0.52,
      w * 0.60, h * 0.55,
    );
    // Tip of thumb
    handPath.quadraticBezierTo(w * 0.69, h * 0.60, w * 0.67, h * 0.67);
    // Thumb web / crease
    handPath.lineTo(w * 0.46, h * 0.68);
    handPath.quadraticBezierTo(w * 0.45, h * 0.72, w * 0.52, h * 0.72);
    // Palm extending under the bag to fingertips on the right
    handPath.lineTo(w * 0.74, h * 0.72);
    handPath.cubicTo(
      w * 0.88, h * 0.66,
      w * 0.95, h * 0.56,
      w * 0.97, h * 0.58,
    );
    // Fingertips curling down/around
    handPath.cubicTo(
      w * 0.98, h * 0.65,
      w * 0.85, h * 0.76,
      w * 0.70, h * 0.84,
    );
    // Bottom of palm curving to wrist
    handPath.cubicTo(
      w * 0.45, h * 0.85,
      w * 0.28, h * 0.88,
      w * 0.24, h * 0.85,
    );
    handPath.lineTo(w * 0.11, h * 0.64);
    handPath.close();

    // 5. Sleeve cuff (diagonal band at bottom-left with parallel gap)
    final cuffPath = Path();
    cuffPath.moveTo(0, h * 0.66);
    cuffPath.lineTo(w * 0.08, h * 0.68);
    cuffPath.lineTo(w * 0.25, h * 0.93);
    cuffPath.lineTo(w * 0.17, h * 0.99);
    cuffPath.lineTo(0, h * 0.76);
    cuffPath.close();

    canvas.drawPath(knotPath, paint);
    canvas.drawPath(bagWithHeart, paint);
    canvas.drawPath(handPath, paint);
    canvas.drawPath(cuffPath, paint);
  }

  @override
  bool shouldRepaint(covariant _DonationBagHandPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// 3. Document / Receipt with horizontal lines and Clock in bottom-right
class BenevoHistoryIcon extends StatelessWidget {
  final double size;
  final Color color;

  const BenevoHistoryIcon({
    super.key,
    this.size = 28.0,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HistoryClockPainter(color: color),
    );
  }
}

class _HistoryClockPainter extends CustomPainter {
  final Color color;

  _HistoryClockPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Document Rounded Rectangle
    final docRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.18, h * 0.12, w * 0.48, h * 0.68),
      const Radius.circular(5.0),
    );
    final docPath = Path()..addRRect(docRect);

    // Three horizontal cutout lines on the document
    final line1 = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(w * 0.28, h * 0.26, w * 0.28, h * 0.06),
          const Radius.circular(2.0),
        ),
      );
    final line2 = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(w * 0.28, h * 0.38, w * 0.28, h * 0.06),
          const Radius.circular(2.0),
        ),
      );
    final line3 = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(w * 0.28, h * 0.50, w * 0.18, h * 0.06),
          const Radius.circular(2.0),
        ),
      );

    var docWithLines = Path.combine(PathOperation.difference, docPath, line1);
    docWithLines = Path.combine(PathOperation.difference, docWithLines, line2);
    docWithLines = Path.combine(PathOperation.difference, docWithLines, line3);

    // Clock Circle overlapping bottom right
    final clockCenter = Offset(w * 0.68, h * 0.66);
    final clockRadius = w * 0.23;
    final clockPath = Path()
      ..addOval(Rect.fromCircle(center: clockCenter, radius: clockRadius));

    final combined = Path.combine(PathOperation.union, docWithLines, clockPath);
    canvas.drawPath(combined, fillPaint);

    // Clock hands (contrast with background)
    final handsPaint = Paint()
      ..color = (color == Colors.white ? AppColors.primary : Colors.white)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.075
      ..strokeCap = StrokeCap.round;

    final clockHands = Path();
    // Hour hand pointing UP (12 o'clock)
    clockHands.moveTo(clockCenter.dx, clockCenter.dy);
    clockHands.lineTo(clockCenter.dx, clockCenter.dy - (clockRadius * 0.58));
    // Minute hand pointing RIGHT (3 o'clock)
    clockHands.moveTo(clockCenter.dx, clockCenter.dy);
    clockHands.lineTo(clockCenter.dx + (clockRadius * 0.58), clockCenter.dy);

    canvas.drawPath(clockHands, handsPaint);
  }

  @override
  bool shouldRepaint(covariant _HistoryClockPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// 4. Heart Nav Icon (Galang Dana / Volunteer Activism)
class BenevoHeartNavIcon extends StatelessWidget {
  final double size;
  final Color color;

  const BenevoHeartNavIcon({
    super.key,
    this.size = 28.0,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _HeartHandsNavPainter(color: color),
    );
  }
}

class _HeartHandsNavPainter extends CustomPainter {
  final Color color;

  _HeartHandsNavPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // 1. Center Heart
    final heartPath = Path();
    final hCx = w * 0.50;
    final hTop = h * 0.16;
    final hW = w * 0.52;
    final hH = h * 0.44;

    heartPath.moveTo(hCx, hTop + hH * 0.30);
    // Left lobe
    heartPath.cubicTo(
      hCx - hW * 0.10, hTop,
      hCx - hW * 0.52, hTop,
      hCx - hW * 0.52, hTop + hH * 0.42,
    );
    heartPath.cubicTo(
      hCx - hW * 0.52, hTop + hH * 0.72,
      hCx - hW * 0.15, hTop + hH * 0.88,
      hCx, hTop + hH,
    );
    // Right lobe
    heartPath.cubicTo(
      hCx + hW * 0.15, hTop + hH * 0.88,
      hCx + hW * 0.52, hTop + hH * 0.72,
      hCx + hW * 0.52, hTop + hH * 0.42,
    );
    heartPath.cubicTo(
      hCx + hW * 0.52, hTop,
      hCx + hW * 0.10, hTop,
      hCx, hTop + hH * 0.30,
    );
    heartPath.close();

    // 2. Left Hand cupping the heart
    final leftHand = Path();
    leftHand.moveTo(w * 0.10, h * 0.80);
    leftHand.lineTo(w * 0.22, h * 0.88);
    leftHand.cubicTo(
      w * 0.34, h * 0.90,
      w * 0.44, h * 0.82,
      w * 0.48, h * 0.74,
    );
    leftHand.lineTo(w * 0.42, h * 0.70);
    leftHand.cubicTo(
      w * 0.36, h * 0.77,
      w * 0.26, h * 0.79,
      w * 0.18, h * 0.75,
    );
    leftHand.lineTo(w * 0.10, h * 0.80);
    leftHand.close();

    // 3. Right Hand cupping the heart (symmetrical)
    final rightHand = Path();
    rightHand.moveTo(w * 0.90, h * 0.80);
    rightHand.lineTo(w * 0.78, h * 0.88);
    rightHand.cubicTo(
      w * 0.66, h * 0.90,
      w * 0.56, h * 0.82,
      w * 0.52, h * 0.74,
    );
    rightHand.lineTo(w * 0.58, h * 0.70);
    rightHand.cubicTo(
      w * 0.64, h * 0.77,
      w * 0.74, h * 0.79,
      w * 0.82, h * 0.75,
    );
    rightHand.lineTo(w * 0.90, h * 0.80);
    rightHand.close();

    canvas.drawPath(heartPath, paint);
    canvas.drawPath(leftHand, paint);
    canvas.drawPath(rightHand, paint);
  }

  @override
  bool shouldRepaint(covariant _HeartHandsNavPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// 5. Profile / User circle icon
class BenevoProfileIcon extends StatelessWidget {
  final double size;
  final Color color;

  const BenevoProfileIcon({
    super.key,
    this.size = 28.0,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ProfileCirclePainter(color: color),
    );
  }
}

class _ProfileCirclePainter extends CustomPainter {
  final Color color;

  _ProfileCirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Solid outer circle
    final outerCircle = Path()
      ..addOval(Rect.fromCircle(center: Offset(w * 0.50, h * 0.50), radius: w * 0.44));

    // Head Cutout
    final headCutout = Path()
      ..addOval(Rect.fromCircle(center: Offset(w * 0.50, h * 0.36), radius: w * 0.16));

    // Shoulders / Torso Cutout
    final torsoCutout = Path();
    torsoCutout.moveTo(w * 0.18, h * 0.86);
    torsoCutout.cubicTo(
      w * 0.22, h * 0.58,
      w * 0.78, h * 0.58,
      w * 0.82, h * 0.86,
    );
    torsoCutout.lineTo(w * 0.18, h * 0.86);
    torsoCutout.close();

    var result = Path.combine(PathOperation.difference, outerCircle, headCutout);
    result = Path.combine(PathOperation.difference, result, torsoCutout);

    canvas.drawPath(result, fillPaint);
  }

  @override
  bool shouldRepaint(covariant _ProfileCirclePainter oldDelegate) =>
      oldDelegate.color != color;
}
