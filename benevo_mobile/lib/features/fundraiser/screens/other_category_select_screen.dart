import 'package:flutter/material.dart';
import 'other_fundraiser_form_screen.dart';

/// Category data model for "jenis bantuan lainnya"
class FundraiserCategory {
  final String name;
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final String description;
  final List<String> requirements;

  const FundraiserCategory({
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.description,
    required this.requirements,
  });
}

/// Screen for selecting other fundraiser categories
/// Displayed after tapping "Buat galang dana" on the second card (jenis bantuan lainnya)
class OtherCategorySelectScreen extends StatelessWidget {
  const OtherCategorySelectScreen({super.key});

  static final List<FundraiserCategory> _categories = [
    FundraiserCategory(
      name: 'Bantuan Pendidikan',
      icon: Icons.school_rounded,
      iconColor: const Color(0xFF5B33A7),
      bgColor: const Color(0xFFF0EAFA),
      description:
          'Galang dana untuk biaya pendidikan, beasiswa, perlengkapan sekolah, atau pembangunan fasilitas pendidikan.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan dari sekolah/universitas',
        'Bukti tagihan biaya pendidikan',
        'Foto dokumentasi kondisi terkait',
      ],
    ),
    FundraiserCategory(
      name: 'Bencana Alam',
      icon: Icons.flood_rounded,
      iconColor: const Color(0xFFD84315),
      bgColor: const Color(0xFFFBE9E7),
      description:
          'Galang dana untuk korban bencana alam seperti banjir, gempa bumi, tanah longsor, kebakaran, dan lainnya.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Dokumentasi foto/video lokasi bencana',
        'Surat keterangan dari RT/RW atau kelurahan',
        'Data jumlah korban terdampak',
      ],
    ),
    FundraiserCategory(
      name: 'Difabel',
      icon: Icons.accessible_rounded,
      iconColor: const Color(0xFF00838F),
      bgColor: const Color(0xFFE0F7FA),
      description:
          'Galang dana untuk membantu penyandang disabilitas, termasuk alat bantu, terapi, dan kebutuhan khusus lainnya.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan disabilitas dari dokter/RS',
        'Foto dokumentasi kondisi penerima manfaat',
        'Rincian kebutuhan dan estimasi biaya',
      ],
    ),
    FundraiserCategory(
      name: 'Infrastruktur Umum',
      icon: Icons.construction_rounded,
      iconColor: const Color(0xFF6D4C41),
      bgColor: const Color(0xFFEFEBE9),
      description:
          'Galang dana untuk pembangunan atau perbaikan infrastruktur umum seperti jalan, jembatan, fasilitas air bersih, dll.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal pembangunan/perbaikan',
        'Foto kondisi infrastruktur saat ini',
        'Surat izin dari pihak berwenang',
        'Rencana Anggaran Biaya (RAB)',
      ],
    ),
    FundraiserCategory(
      name: 'Karya Kreatif dan Inovasi Sosial',
      icon: Icons.lightbulb_rounded,
      iconColor: const Color(0xFFF9A825),
      bgColor: const Color(0xFFFFF8E1),
      description:
          'Galang dana untuk proyek kreatif, seni, budaya, teknologi sosial, atau inovasi yang bermanfaat bagi masyarakat.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal proyek kreatif/inovasi',
        'Portofolio atau contoh karya sebelumnya',
        'Rincian penggunaan dana',
      ],
    ),
    FundraiserCategory(
      name: 'Kegiatan Sosial',
      icon: Icons.groups_rounded,
      iconColor: const Color(0xFF43A047),
      bgColor: const Color(0xFFE8F5E9),
      description:
          'Galang dana untuk kegiatan sosial seperti bakti sosial, santunan, pemberdayaan masyarakat, dan program sosial lainnya.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal kegiatan sosial',
        'Foto dokumentasi kegiatan sebelumnya (jika ada)',
        'Rencana penggunaan dana',
      ],
    ),
    FundraiserCategory(
      name: 'Lingkungan',
      icon: Icons.eco_rounded,
      iconColor: const Color(0xFF2E7D32),
      bgColor: const Color(0xFFE8F5E9),
      description:
          'Galang dana untuk pelestarian lingkungan, reboisasi, pengelolaan sampah, konservasi, dan program lingkungan lainnya.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal program lingkungan',
        'Foto dokumentasi kondisi lingkungan',
        'Izin dari pihak terkait (jika diperlukan)',
      ],
    ),
    FundraiserCategory(
      name: 'Tempat Ibadah',
      icon: Icons.mosque_rounded,
      iconColor: const Color(0xFF1565C0),
      bgColor: const Color(0xFFE3F2FD),
      description:
          'Galang dana untuk pembangunan, renovasi, atau pemeliharaan tempat ibadah seperti masjid, mushola, gereja, pura, dan vihara.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan dari pengurus tempat ibadah',
        'Foto kondisi tempat ibadah saat ini',
        'Rencana Anggaran Biaya (RAB)',
      ],
    ),
    FundraiserCategory(
      name: 'Panti Asuhan',
      icon: Icons.home_rounded,
      iconColor: const Color(0xFF8E24AA),
      bgColor: const Color(0xFFF3E5F5),
      description:
          'Galang dana untuk kebutuhan panti asuhan, seperti biaya operasional, makanan, pendidikan anak asuh, dan perbaikan fasilitas.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan dari panti asuhan',
        'Foto dokumentasi kondisi panti asuhan',
        'Rincian kebutuhan dan estimasi biaya',
      ],
    ),
  ];

  void _showCategoryDetail(BuildContext context, FundraiserCategory category) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext ctx) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
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
                  // Category icon + title
                  Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: category.bgColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          category.icon,
                          color: category.iconColor,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          category.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF261943),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Description
                  Text(
                    category.description,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF53456D),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Requirements header
                  const Text(
                    'Pastikan kamu memiliki:',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF341B5C),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Requirements list
                  ...category.requirements.map(
                    (req) => Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
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
                            child: Text(
                              req,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF341B5C),
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Disclaimer box
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
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 1.0),
                          child: Icon(
                            Icons.info_rounded,
                            size: 16,
                            color: Color(0xFF5B33A7),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Pastikan bahwa setiap dokumen yang diunggah telah melalui proses validasi. Dokumen yang disertakan harus asli dan dapat dipertanggungjawabkan.',
                            style: TextStyle(
                              fontSize: 10.5,
                              color: Color(0xFF53456D),
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // "Pilih kategori ini" button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(); // close dialog
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => OtherFundraiserFormScreen(
                            category: category,
                          ),
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
                      'Pilih kategori ini',
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
          'Pilih Kategori Galang Dana',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          itemCount: _categories.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final cat = _categories[index];
            return _buildCategoryTile(context, cat);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryTile(BuildContext context, FundraiserCategory category) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFECE7F6),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B33A7).withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => _showCategoryDetail(context, category),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            child: Row(
              children: [
                // Icon box
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: category.bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    category.icon,
                    color: category.iconColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 14),

                // Title
                Expanded(
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF261943),
                    ),
                  ),
                ),

                // Arrow
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFF887D9C),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
