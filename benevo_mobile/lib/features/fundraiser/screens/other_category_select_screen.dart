import 'package:flutter/material.dart';
import '../../home/widgets/benevo_bottom_nav_bar.dart';
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
/// Matching media_1793031612642_b2fdc91e.png
class OtherCategorySelectScreen extends StatefulWidget {
  final VoidCallback? onBackToHome;

  const OtherCategorySelectScreen({
    super.key,
    this.onBackToHome,
  });

  @override
  State<OtherCategorySelectScreen> createState() =>
      _OtherCategorySelectScreenState();
}

class _OtherCategorySelectScreenState extends State<OtherCategorySelectScreen> {
  int _currentNavIndex = 3;

  static final List<FundraiserCategory> _categories = [
    const FundraiserCategory(
      name: 'Bantuan Pendidikan',
      icon: Icons.school_rounded,
      iconColor: Color(0xFF5B33A7),
      bgColor: Color(0xFFF0EAFA),
      description:
          'Galang dana untuk membantu biaya pendidikan, perlengkapan sekolah, beasiswa, dan kebutuhan edukasi lainnya.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan dari sekolah/universitas',
        'Bukti tagihan biaya pendidikan',
        'Foto dokumentasi kondisi terkait',
      ],
    ),
    const FundraiserCategory(
      name: 'Bencana Alam',
      icon: Icons.flood_rounded,
      iconColor: Color(0xFFD84315),
      bgColor: Color(0xFFFBE9E7),
      description:
          'Galang dana untuk membantu korban yang terdampak bencana alam seperti gempa, banjir, dll.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Dokumentasi foto/video lokasi bencana',
        'Surat keterangan dari RT/RW atau kelurahan',
        'Data jumlah korban terdampak',
      ],
    ),
    const FundraiserCategory(
      name: 'Difabel',
      icon: Icons.accessible_rounded,
      iconColor: Color(0xFF00838F),
      bgColor: Color(0xFFE0F7FA),
      description:
          'Galang dana untuk membantu penyandang disabilitas mendapatkan alat bantu, terapi, dan fasilitas yang layak.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan disabilitas dari dokter/RS',
        'Foto dokumentasi kondisi penerima manfaat',
        'Rincian kebutuhan dan estimasi biaya',
      ],
    ),
    const FundraiserCategory(
      name: 'Infrastruktur Umum',
      icon: Icons.construction_rounded,
      iconColor: Color(0xFF6D4C41),
      bgColor: Color(0xFFEFEBE9),
      description:
          'Galang dana untuk perbaikan atau pembangunan fasilitas umum seperti jalan, jembatan, sarana air bersih, dll.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal pembangunan/perbaikan',
        'Foto kondisi infrastruktur saat ini',
        'Surat izin dari pihak berwenang',
        'Rencana Anggaran Biaya (RAB)',
      ],
    ),
    const FundraiserCategory(
      name: 'Karya Kreatif dan Modal Usaha',
      icon: Icons.lightbulb_rounded,
      iconColor: Color(0xFFF9A825),
      bgColor: Color(0xFFFFF8E1),
      description:
          'Galang dana untuk mendukung modal usaha kecil, pemberdayaan ekonomi, atau karya seni dan inovasi sosial.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal proyek kreatif/usaha',
        'Portofolio atau contoh produk/karya',
        'Rincian penggunaan dana',
      ],
    ),
    const FundraiserCategory(
      name: 'Kegiatan Sosial',
      icon: Icons.groups_rounded,
      iconColor: Color(0xFF43A047),
      bgColor: Color(0xFFE8F5E9),
      description:
          'Galang dana untuk program kemasyarakatan, santunan, bakti sosial, dan kepedulian bersama.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal kegiatan sosial',
        'Foto dokumentasi kegiatan sebelumnya',
        'Rencana penggunaan dana',
      ],
    ),
    const FundraiserCategory(
      name: 'Lingkungan',
      icon: Icons.eco_rounded,
      iconColor: Color(0xFF2E7D32),
      bgColor: Color(0xFFE8F5E9),
      description:
          'Galang dana untuk pelestarian alam, penghijauan, kebersihan lingkungan, dan penanganan krisis ekologis.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Proposal program lingkungan',
        'Foto dokumentasi kondisi lingkungan',
        'Izin dari pihak terkait',
      ],
    ),
    const FundraiserCategory(
      name: 'Tempat Ibadah',
      icon: Icons.mosque_rounded,
      iconColor: Color(0xFF1565C0),
      bgColor: Color(0xFFE3F2FD),
      description:
          'Galang dana untuk pembangunan, renovasi, atau sarana ibadah demi kenyamanan jamaah.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan dari pengurus tempat ibadah',
        'Foto kondisi tempat ibadah saat ini',
        'Rencana Anggaran Biaya (RAB)',
      ],
    ),
    const FundraiserCategory(
      name: 'Panti Asuhan',
      icon: Icons.home_rounded,
      iconColor: Color(0xFF8E24AA),
      bgColor: Color(0xFFF3E5F5),
      description:
          'Galang dana untuk operasional panti, kebutuhan pokok, dan masa depan anak-anak panti asuhan.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Surat keterangan dari panti asuhan',
        'Foto dokumentasi kondisi panti asuhan',
        'Rincian kebutuhan dan estimasi biaya',
      ],
    ),
    const FundraiserCategory(
      name: 'Menolong Hewan',
      icon: Icons.pets_rounded,
      iconColor: Color(0xFFE65100),
      bgColor: Color(0xFFFFF3E0),
      description:
          'Galang dana untuk rescue, pengobatan hewan sakit/terlantar, dan operasional shelter hewan.',
      requirements: [
        'KTP/Identitas penggalang dana',
        'Foto kondisi hewan yang memerlukan pertolongan',
        'Rincian perkiraan biaya medis hewan',
      ],
    ),
  ];

  void _showCategoryBottomSheet(
      BuildContext context, FundraiserCategory category) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (BuildContext sheetCtx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 20, 22, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top drag handle indicator
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDD4EC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 18),

                // Title
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF261943),
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 8),

                // Description
                Text(
                  category.description,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF53456D),
                    height: 1.45,
                  ),
                ),

                const SizedBox(height: 24),

                // Primary Button: "Pilih kategori galang dana"
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(sheetCtx).pop(); // close bottom sheet
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
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Pilih kategori galang dana',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Secondary Button: "Pilih kategori lain"
                OutlinedButton(
                  onPressed: () => Navigator.of(sheetCtx).pop(),
                  style: OutlinedButton.styleFrom(
                    side:
                        const BorderSide(color: Color(0xFF5B33A7), width: 1.2),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Pilih kategori lain',
                    style: TextStyle(
                      color: Color(0xFF5B33A7),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
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
          'Pilih Kategori galang dana',
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          itemCount: _categories.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final cat = _categories[index];
            return _buildCategoryTile(context, cat);
          },
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
            color: const Color(0xFF5B33A7).withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => _showCategoryBottomSheet(context, category),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            child: Row(
              children: [
                // Icon Box
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: category.bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    category.icon,
                    color: category.iconColor,
                    size: 23,
                  ),
                ),
                const SizedBox(width: 14),

                // Category Name
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

                // Chevron Right
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
