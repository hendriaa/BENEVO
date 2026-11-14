import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/benevo_logo.dart';
import 'register_screen.dart';

class SplashScreen extends StatefulWidget {
  final Duration duration;

  const SplashScreen({
    super.key,
    this.duration = const Duration(milliseconds: 4000), // Durasi 4 detik agar terlihat jelas oleh pengguna
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    // Set status bar transparan dan ikon putih
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFF4A267B),
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Timer splash screen selama 4 detik langsung ke halaman utama/register
    _timer = Timer(widget.duration, () {
      _navigateToNext();
    });
  }

  void _navigateToNext() {
    if (_hasNavigated || !mounted) return;
    _hasNavigated = true;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RegisterScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF714DB1), // Warna ungu dasar desain asli
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _navigateToNext, // Pengguna bisa tap untuk langsung lanjut jika diinginkan
        child: Stack(
          fit: StackFit.expand,
          children: [
            // 1. Fluid organic wave shapes bagian atas (persis desain referensi)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/splash_top_waves.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),

            // 2. Fluid organic wave shapes bagian bawah (persis desain referensi)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/splash_bottom_waves.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),

            // 3. Logo dan Nama Brand di tengah (Optical center) - langsung tampil dari frame pertama
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo Benevo transparan floating (tanpa kotak border)
                    const BenevoLogo(
                      size: 92,
                      showShadow: false,
                      transparentBackground: true,
                    ),

                    const SizedBox(height: 16),

                    // Teks "Benevo •" dengan gradasi warna dan titik kuning persis mockup
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF53358D),
                              Color(0xFF7B4BB8),
                              Color(0xFFAE7FB5),
                              Color(0xFFCEB189),
                              Color(0xFFE5D570),
                            ],
                            stops: [0.0, 0.32, 0.58, 0.82, 1.0],
                          ).createShader(bounds),
                          child: const Text(
                            'Benevo',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.5, top: 4.0),
                          child: Container(
                            width: 7.2,
                            height: 7.2,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE5D570),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
