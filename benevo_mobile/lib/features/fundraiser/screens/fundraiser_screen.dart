import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

/// Screen for "Galang Dana" (Fundraiser flow & guide)
/// Separated into its own dedicated screen file as requested.
class FundraiserScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;

  const FundraiserScreen({
    super.key,
    this.onBackToHome,
  });

  @override
  State<FundraiserScreen> createState() => _FundraiserScreenState();
}

class _FundraiserScreenState extends State<FundraiserScreen> {
  void _onStartFundraiser() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Membuka formulir pembuatan penggalangan dana...'),
        backgroundColor: AppColors.primary,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Top App Bar & Hero Header
              _buildHeroHeader(context),

              // 2. Section "Cara Galang dana di Benevo"
              _buildCaraGalangDanaSection(),

              const SizedBox(height: 18),

              // 3. Section "Tips Galang dana"
              _buildTipsSection(),

              const SizedBox(height: 22),

              // 4. Section CTA "Sudah tahu tata caranya, kan?"
              _buildCtaSection(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// 1. Top App Bar & Hero Header with gradient, illustration, and CTA button
  Widget _buildHeroHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF9F5FE),
            Color(0xFFE9DCF8),
            Color(0xFFC7B3E5),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            children: [
              // Navigation Bar: Back button + Centered Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button (lavender circular button)
                  GestureDetector(
                    onTap: () {
                      if (widget.onBackToHome != null) {
                        widget.onBackToHome!();
                      } else if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.90),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.primary,
                        size: 22,
                      ),
                    ),
                  ),

                  // Brand Logo "Benevo"
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Bene',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF4C2A91),
                                letterSpacing: -0.5,
                              ),
                            ),
                            TextSpan(
                              text: 'vo',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFDCA722),
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 2),
                      Container(
                        margin: const EdgeInsets.only(top: 3),
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: Color(0xFFDCA722),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),

                  // Symmetrical spacer for exact centering
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 12),

              // Hero Illustration
              Image.asset(
                'assets/images/fundraiser_hero.png',
                height: 195,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 14),

              // Headline
              const Text(
                'Galang Dana untuk semua\nyang membutuhkan!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF321E54),
                  height: 1.25,
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Di Benevo ada banyak orang dermawan yang berdonasi untuk menolong sesama!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF53456D),
                    height: 1.35,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Hero Button
              ElevatedButton(
                onPressed: _onStartFundraiser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: AppColors.primary.withValues(alpha: 0.35),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Galang dana sekarang!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  /// 2. Section "Cara Galang dana di Benevo" with vertical numbered timeline
  Widget _buildCaraGalangDanaSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cara Galang dana di Benevo',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF261943),
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 16),

          // Steps list with vertical timeline connector
          _buildTimelineStep(
            stepNumber: 1,
            title: 'Pilih jenis galang dana',
            description:
                'terdapat beberapa kategori penggalangan dana agar mempermudah penyaluran bantuan',
            icon: const _MedicalCrossHeartIcon(),
            isLast: false,
          ),
          _buildTimelineStep(
            stepNumber: 2,
            title: 'Isi form pembuatan dana',
            description:
                'isi form secara lengkap dengan mengikuti instruksi yang diberikan',
            icon: const _LaptopFormIcon(),
            isLast: false,
          ),
          _buildTimelineStep(
            stepNumber: 3,
            title: 'Verifikasi Galang dana kamu',
            description:
                'Lakukan verifikasi identitas dan dokumen terutama golongan medis',
            icon: const _DocumentVerifyIcon(),
            isLast: true,
          ),
        ],
      ),
    );
  }

  /// Timeline step row
  Widget _buildTimelineStep({
    required int stepNumber,
    required String title,
    required String description,
    required Widget icon,
    required bool isLast,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Step number indicator & vertical connector line
          Column(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                  color: Color(0xFF7251A4),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$stepNumber',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 1.8,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: const Color(0xFFD6C8E8),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 12),

          // Card content
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFF0EBF8),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF321E54).withValues(alpha: 0.05),
                    blurRadius: 14,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Illustrated Vector Icon
                  icon,
                  const SizedBox(width: 12),

                  // Text Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF261943),
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF6B5E82),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 3. Section "Tips Galang dana"
  Widget _buildTipsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tips Galang dana',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF261943),
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Agar galang dana kamu lancar, kamu perlu memperhatikan beberapa hal berikut ini:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B5E82),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),

          // Tip 1: Verifikasi Identitas & dokumen
          _buildTipCard(
            icon: const _TipIdCardIcon(),
            title: 'Verifikasi Identitas & dokumen',
            description:
                'Lakukan verifikasi agar galang danamu lebih terpercaya untuk di donasi',
          ),

          const SizedBox(height: 12),

          // Tip 2: Sebarkan galang dana kamu sesering mungkin
          _buildTipCard(
            icon: const _TipMegaphoneIcon(),
            title: 'Sebarkan galang dana kamu sesering mungkin',
            description:
                'Makin sering disebarkan, makin besar peluang galang danamu mendapatkan donasi',
          ),
        ],
      ),
    );
  }

  /// Tip card item
  Widget _buildTipCard({
    required Widget icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFF0EBF8),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF321E54).withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF261943),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B5E82),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 4. Section CTA "Sudah tahu tata caranya, kan?"
  Widget _buildCtaSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6743A9),
              Color(0xFF512F94),
            ],
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.28),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'Sudah tahu tata caranya, kan?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.5,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Yuk, buat galang dana kamu dan salurkan bantuan dari donasi kamu sebanyak mungkin!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white.withValues(alpha: 0.90),
                height: 1.35,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onStartFundraiser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  elevation: 2,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Galang Dana Sekarang',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// BESPOKE ILLUSTRATED VECTOR ICONS MATCHING THE DESIGN
// ============================================================================

/// Step 1: Medical Cross & Golden Heart Icon
class _MedicalCrossHeartIcon extends StatelessWidget {
  const _MedicalCrossHeartIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(44, 44),
      painter: _MedicalCrossHeartPainter(),
    );
  }
}

class _MedicalCrossHeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 1. Golden Yellow Circle with medical cross
    final circlePaint = Paint()
      ..color = const Color(0xFFF7C744)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.40, h * 0.38), w * 0.28, circlePaint);

    // Purple Medical Cross '+'
    final crossPaint = Paint()
      ..color = const Color(0xFF5B33A7)
      ..style = PaintingStyle.fill;

    const crossW = 4.5;
    const crossL = 14.0;
    // vertical
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(w * 0.40, h * 0.38), width: crossW, height: crossL),
        const Radius.circular(2),
      ),
      crossPaint,
    );
    // horizontal
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(w * 0.40, h * 0.38), width: crossL, height: crossW),
        const Radius.circular(2),
      ),
      crossPaint,
    );

    // 2. Purple Heart Badge overlapping bottom right
    final badgePaint = Paint()
      ..color = const Color(0xFF5B33A7)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.66, h * 0.68), w * 0.24, badgePaint);

    // Golden Heart inside badge
    final goldHeartPaint = Paint()
      ..color = const Color(0xFFF7C744)
      ..style = PaintingStyle.fill;

    final heartPath = Path();
    final hCx = w * 0.66;
    final hTop = h * 0.58;
    const hW = 12.0;
    const hH = 10.0;

    heartPath.moveTo(hCx, hTop + hH * 0.30);
    heartPath.cubicTo(
      hCx - hW * 0.10, hTop,
      hCx - hW * 0.50, hTop,
      hCx - hW * 0.50, hTop + hH * 0.42,
    );
    heartPath.cubicTo(
      hCx - hW * 0.50, hTop + hH * 0.72,
      hCx - hW * 0.15, hTop + hH * 0.88,
      hCx, hTop + hH,
    );
    heartPath.cubicTo(
      hCx + hW * 0.15, hTop + hH * 0.88,
      hCx + hW * 0.50, hTop + hH * 0.72,
      hCx + hW * 0.50, hTop + hH * 0.42,
    );
    heartPath.cubicTo(
      hCx + hW * 0.50, hTop,
      hCx + hW * 0.10, hTop,
      hCx, hTop + hH * 0.30,
    );
    heartPath.close();

    canvas.drawPath(heartPath, goldHeartPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Step 2: Isometric Laptop with Digital Form Icon
class _LaptopFormIcon extends StatelessWidget {
  const _LaptopFormIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(44, 44),
      painter: _LaptopFormPainter(),
    );
  }
}

class _LaptopFormPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Screen Bezel
    final bezelPaint = Paint()
      ..color = const Color(0xFF6743A9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final screenRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.22, h * 0.14, w * 0.56, h * 0.46),
      const Radius.circular(4),
    );
    canvas.drawRRect(screenRect, bezelPaint);

    // Screen fill
    final screenFill = Paint()
      ..color = const Color(0xFFF3EDFA)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(screenRect, screenFill);

    // Form lines inside screen
    final linePaint = Paint()
      ..color = const Color(0xFF7251A4)
      ..style = PaintingStyle.fill;

    // Header bar
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.30, h * 0.22, w * 0.40, 2.5),
        const Radius.circular(1),
      ),
      linePaint,
    );

    // Golden check box / dot
    final goldDot = Paint()
      ..color = const Color(0xFFF7C744)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.33, h * 0.33), 2.0, goldDot);

    // Form line 1
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.40, h * 0.31, w * 0.30, 2.2),
        const Radius.circular(1),
      ),
      linePaint,
    );

    // Form line 2
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.40, h * 0.41, w * 0.26, 2.2),
        const Radius.circular(1),
      ),
      linePaint,
    );

    // Laptop Base
    final basePaint = Paint()
      ..color = const Color(0xFF6743A9)
      ..style = PaintingStyle.fill;

    final basePath = Path();
    basePath.moveTo(w * 0.12, h * 0.64);
    basePath.lineTo(w * 0.88, h * 0.64);
    basePath.lineTo(w * 0.82, h * 0.72);
    basePath.lineTo(w * 0.18, h * 0.72);
    basePath.close();

    canvas.drawPath(basePath, basePaint);

    // Keyboard notch
    final notchPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(w * 0.50, h * 0.66), width: 14, height: 2),
        const Radius.circular(1),
      ),
      notchPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Step 3: Document with Golden Verified Badge Icon
class _DocumentVerifyIcon extends StatelessWidget {
  const _DocumentVerifyIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(44, 44),
      painter: _DocumentVerifyPainter(),
    );
  }
}

class _DocumentVerifyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Document Card in background
    final cardFill = Paint()
      ..color = const Color(0xFFE9DCF8)
      ..style = PaintingStyle.fill;
    final cardBorder = Paint()
      ..color = const Color(0xFF6743A9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;

    final cardRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.14, h * 0.20, w * 0.60, h * 0.52),
      const Radius.circular(5),
    );
    canvas.drawRRect(cardRect, cardFill);
    canvas.drawRRect(cardRect, cardBorder);

    // ID Photo box
    final photoPaint = Paint()
      ..color = const Color(0xFF7251A4)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.20, h * 0.30, w * 0.20, h * 0.28),
        const Radius.circular(3),
      ),
      photoPaint,
    );

    // Text stripes
    final stripePaint = Paint()
      ..color = const Color(0xFF6743A9)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.44, h * 0.32, w * 0.24, 2.5),
        const Radius.circular(1),
      ),
      stripePaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.44, h * 0.42, w * 0.20, 2.5),
        const Radius.circular(1),
      ),
      stripePaint,
    );

    // Golden Verified Badge
    final badgePaint = Paint()
      ..color = const Color(0xFFF7C744)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.22, h * 0.64), w * 0.16, badgePaint);

    // White Checkmark
    final checkPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final checkPath = Path();
    checkPath.moveTo(w * 0.16, h * 0.64);
    checkPath.lineTo(w * 0.21, h * 0.69);
    checkPath.lineTo(w * 0.28, h * 0.59);

    canvas.drawPath(checkPath, checkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Tip 1: Purple ID Card with Golden Verified Badge
class _TipIdCardIcon extends StatelessWidget {
  const _TipIdCardIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(52, 46),
      painter: _TipIdCardPainter(),
    );
  }
}

class _TipIdCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Purple Card Body
    final cardRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.05, h * 0.12, w * 0.82, h * 0.68),
      const Radius.circular(8),
    );
    final cardPaint = Paint()
      ..color = const Color(0xFF6743A9)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(cardRect, cardPaint);

    // Avatar silhouette on left of ID card
    final avatarPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Head
    canvas.drawCircle(Offset(w * 0.26, h * 0.36), w * 0.09, avatarPaint);

    // Torso
    final torsoPath = Path();
    torsoPath.moveTo(w * 0.15, h * 0.62);
    torsoPath.cubicTo(
      w * 0.16, h * 0.48,
      w * 0.36, h * 0.48,
      w * 0.37, h * 0.62,
    );
    torsoPath.close();
    canvas.drawPath(torsoPath, avatarPaint);

    // Info lines on right of ID card
    final linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.44, h * 0.28, w * 0.34, 3.0),
        const Radius.circular(1.5),
      ),
      linePaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.44, h * 0.40, w * 0.28, 3.0),
        const Radius.circular(1.5),
      ),
      linePaint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.44, h * 0.52, w * 0.20, 3.0),
        const Radius.circular(1.5),
      ),
      linePaint,
    );

    // Golden Verified Shield / Circle Badge at bottom right
    final badgePaint = Paint()
      ..color = const Color(0xFFF7C744)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.72, h * 0.72), w * 0.18, badgePaint);

    // White Checkmark
    final checkPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final checkPath = Path();
    checkPath.moveTo(w * 0.65, h * 0.72);
    checkPath.lineTo(w * 0.71, h * 0.78);
    checkPath.lineTo(w * 0.79, h * 0.66);

    canvas.drawPath(checkPath, checkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Tip 2: Megaphone with Golden Aura Icon
class _TipMegaphoneIcon extends StatelessWidget {
  const _TipMegaphoneIcon();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(52, 46),
      painter: _TipMegaphonePainter(),
    );
  }
}

class _TipMegaphonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Golden Circular Background Aura
    final auraPaint = Paint()
      ..color = const Color(0xFFFDE888)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(w * 0.50, h * 0.50), w * 0.40, auraPaint);

    final purplePaint = Paint()
      ..color = const Color(0xFF6743A9)
      ..style = PaintingStyle.fill;

    // Megaphone Cone
    final conePath = Path();
    conePath.moveTo(w * 0.32, h * 0.42);
    conePath.lineTo(w * 0.62, h * 0.24);
    conePath.lineTo(w * 0.64, h * 0.64);
    conePath.lineTo(w * 0.32, h * 0.52);
    conePath.close();
    canvas.drawPath(conePath, purplePaint);

    // Megaphone Bell Ring on the right
    final bellPaint = Paint()
      ..color = const Color(0xFF512F94)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final bellPath = Path();
    bellPath.moveTo(w * 0.64, h * 0.22);
    bellPath.quadraticBezierTo(w * 0.70, h * 0.44, w * 0.64, h * 0.66);
    canvas.drawPath(bellPath, bellPaint);

    // Megaphone Cylinder on the left
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.22, h * 0.41, w * 0.12, h * 0.13),
        const Radius.circular(2),
      ),
      purplePaint,
    );

    // Handle
    final handlePath = Path();
    handlePath.moveTo(w * 0.36, h * 0.52);
    handlePath.lineTo(w * 0.42, h * 0.72);
    handlePath.lineTo(w * 0.48, h * 0.70);
    handlePath.lineTo(w * 0.42, h * 0.51);
    handlePath.close();
    canvas.drawPath(handlePath, purplePaint);

    // Sound waves on the right
    final wavePaint = Paint()
      ..color = const Color(0xFF6743A9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    final wave1 = Path();
    wave1.moveTo(w * 0.74, h * 0.32);
    wave1.quadraticBezierTo(w * 0.80, h * 0.44, w * 0.74, h * 0.56);
    canvas.drawPath(wave1, wavePaint);

    final wave2 = Path();
    wave2.moveTo(w * 0.82, h * 0.26);
    wave2.quadraticBezierTo(w * 0.90, h * 0.44, w * 0.82, h * 0.62);
    canvas.drawPath(wave2, wavePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
