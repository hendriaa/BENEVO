import 'package:flutter/material.dart';
import '../../home/widgets/benevo_bottom_nav_bar.dart';
import 'medical_fundraiser_form_screen.dart';
import 'other_category_select_screen.dart';

/// Screen for selecting fundraiser category ("Pengajuan Menggalang Dana")
/// matching media_1793020217536_bd0e3a31.png and media_1793020240603_83ba8be0.png
class FundraiserCategoryScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;

  const FundraiserCategoryScreen({
    super.key,
    this.onBackToHome,
  });

  @override
  State<FundraiserCategoryScreen> createState() => _FundraiserCategoryScreenState();
}

class _FundraiserCategoryScreenState extends State<FundraiserCategoryScreen> {
  int _currentNavIndex = 3;

  void _showRequirementsDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.20),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title
                  const Text(
                    'Pastikan kamu orang yang berhak membuat galang dana dengan memiliki rincian persyaratan dokumen berikut :',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF261943),
                      height: 1.35,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Bullet Points
                  _buildBulletPoint(
                    boldPrefix: 'KTP Kamu ',
                    text: 'sebagai penggalang dana',
                  ),
                  const SizedBox(height: 6),
                  _buildBulletPoint(
                    boldPrefix: 'Kartu Keluarga pasien',
                    text: '',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 2.0, bottom: 6.0),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 11.5, color: Color(0xFF4A3C63), height: 1.3),
                        children: [
                          TextSpan(text: '- Jika Pasien belum ada KK, sertakan '),
                          TextSpan(
                            text: 'akta/Surat Keterangan Lahir',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildBulletPoint(
                    boldPrefix: 'Surat Keterangan Medis ',
                    text: 'dengan keterangan ',
                    boldSuffix: 'diagnosis/penyakit',
                  ),
                  const SizedBox(height: 6),
                  _buildBulletPoint(
                    boldPrefix: 'Hasil Pemeriksaan ',
                    text: '(lab, rontgen,dsb.)',
                  ),

                  const SizedBox(height: 16),

                  // Disclaimer Box
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F0FC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFD6C6EC),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 1.0),
                          child: Icon(
                            Icons.info_rounded,
                            size: 16,
                            color: Color(0xFF5B33A7),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 10.5,
                                color: Color(0xFF53456D),
                                height: 1.35,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Disclaimer: ',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                  text:
                                      'Pastikan bahwa setiap dokumen yang diunggah dalam galang dana ini telah melalui proses validasi. Dengan demikian, dokumen yang disertakan adalah asli dan dapat dipertanggungjawabkan.',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // "Mengerti" Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // close dialog
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MedicalFundraiserFormScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5B33A7),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Mengerti',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBulletPoint({
    required String boldPrefix,
    required String text,
    String? boldSuffix,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '• ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xFF261943),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF341B5C),
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: boldPrefix,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                TextSpan(text: text),
                if (boldSuffix != null)
                  TextSpan(
                    text: boldSuffix,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B33A7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pengajuan Menggalang Dana',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headline
              const Text(
                'Hai Orang Baik!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF341B5C),
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Kamu ingin menggalang dana untuk apa nih',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF887D9C),
                ),
              ),

              const SizedBox(height: 20),

              // Card 1: Orang sakit dan keperluan medis
              _buildCategoryCard(
                iconWidget: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7251A4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.add_rounded,
                    color: Color(0xFFF7C744),
                    size: 30,
                  ),
                ),
                title: 'Galang dana bantuan untuk orang sakit dan keperluan medis',
                subtitle: 'khusus biaya pengobatan atau perawatan penyakit tertentu.',
                buttonText: 'Buat galang dana',
                onTap: _showRequirementsDialog,
              ),

              const SizedBox(height: 18),

              // Card 2: Jenis bantuan lainnya
              _buildCategoryCard(
                iconWidget: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDE8A5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.favorite_rounded,
                    color: Color(0xFF5B33A7),
                    size: 24,
                  ),
                ),
                title: 'Galang Dana untuk jenis bantuan lainnya',
                subtitle: 'serupa dengan jenis bantuan, bencana alam, pendidikan, kemanusiaan, dsb.',
                buttonText: 'Buat galang dana',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const OtherCategorySelectScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BenevoBottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
          if (index != 3) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }

  Widget _buildCategoryCard({
    required Widget iconWidget,
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFECE7F6),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B33A7).withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconWidget,
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
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF756E87),
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                OutlinedButton(
                  onPressed: onTap,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF5B33A7), width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Color(0xFF5B33A7),
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
