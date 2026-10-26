import 'package:flutter/material.dart';
import '../../home/screens/dashboard_screen.dart';

/// Screen displayed upon successful fundraiser submission
/// Matching media_1793020410670_311d2112.png
class FundraiserSuccessScreen extends StatelessWidget {
  final String campaignTitle;

  const FundraiserSuccessScreen({
    super.key,
    this.campaignTitle = 'Bantu Operasi Jantung Adik Vasya',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B33A7),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Pengajuan Terkirim',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // 1. Success Green Checkmark Illustration
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF90CE9A).withValues(alpha: 0.50),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Color(0xFF5CB85C),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 54,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 2. Headline
              const Text(
                'Pengajuan Berhasil\nterkirim',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF341B5C),
                  height: 1.25,
                  letterSpacing: -0.3,
                ),
              ),

              const SizedBox(height: 12),

              // 3. Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF53456D),
                      height: 1.45,
                    ),
                    children: [
                      const TextSpan(text: 'Pengajuan Penggalangan Dana untuk '),
                      TextSpan(
                        text: campaignTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF261943),
                        ),
                      ),
                      const TextSpan(
                        text: ' Admin akan memeriksa pengajuan kampanye anda dalam sekitar 1 × 24 jam',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 4. Stepper / Status Indicator (Terkirim -> Kurasi -> Aktif)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    // Node 1: Terkirim
                    _buildStepNode(
                      title: 'Terkirim',
                      isActive: true,
                      hasUnderline: true,
                    ),
                    // Connector 1
                    Expanded(
                      child: Container(
                        height: 2.0,
                        color: const Color(0xFFD6CDDC),
                      ),
                    ),
                    // Node 2: Kurasi
                    _buildStepNode(
                      title: 'Kurasi',
                      isActive: false,
                      hasUnderline: false,
                    ),
                    // Connector 2
                    Expanded(
                      child: Container(
                        height: 2.0,
                        color: const Color(0xFFD6CDDC),
                      ),
                    ),
                    // Node 3: Aktif
                    _buildStepNode(
                      title: 'Aktif',
                      isActive: false,
                      hasUnderline: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // 5. Subtitle Note
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Hasil kurasi dikirim lewat notifikasi : Aktif, Revisi (dengan catatan) Ditolak.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF756E87),
                    height: 1.35,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // 6. Action Buttons
              // Button 1: Lihat status Pengajuan
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Status pengajuan sedang dalam antrean kurasi admin.'),
                      backgroundColor: Color(0xFF5B33A7),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5B33A7),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 46),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Lihat status Pengajuan',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Button 2: Kembali ke beranda
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4CAE4),
                  foregroundColor: const Color(0xFF261943),
                  minimumSize: const Size(double.infinity, 46),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Kembali ke beranda',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF261943),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepNode({
    required String title,
    required bool isActive,
    required bool hasUnderline,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF5B33A7) : const Color(0xFFD6CDDC),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.only(bottom: 2.0),
          decoration: hasUnderline
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF1E88E5),
                      width: 2.2,
                    ),
                  ),
                )
              : null,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
              color: isActive ? const Color(0xFF1E88E5) : const Color(0xFF887D9C),
            ),
          ),
        ),
      ],
    );
  }
}
