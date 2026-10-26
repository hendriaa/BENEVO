import 'package:flutter/material.dart';
import 'campaign_detail_screen.dart';
import '../../home/screens/category_campaigns_screen.dart';
import '../../home/screens/sort_screen.dart';
import '../../home/screens/filter_screen.dart';
import '../../home/screens/search_screen.dart';

class DonationCatalogScreen extends StatefulWidget {
  final VoidCallback? onProfileTap;

  const DonationCatalogScreen({
    super.key,
    this.onProfileTap,
  });

  @override
  State<DonationCatalogScreen> createState() => _DonationCatalogScreenState();
}

class _DonationCatalogScreenState extends State<DonationCatalogScreen> {
  SortOption _currentSort = SortOption.palingMendesak;
  bool _olehBenevo = true;
  bool _digalangYayasan = true;
  bool _digalangPublik = false;

  final List<Map<String, dynamic>> _categories = [
    {'title': 'Bencana Alam', 'icon': Icons.flood_outlined},
    {'title': 'Balita & Anak Sakit', 'icon': Icons.child_care_rounded},
    {'title': 'Bantuan & Medis', 'icon': Icons.medical_services_outlined},
    {'title': 'Bantuan Pendidikan', 'icon': Icons.school_outlined},
    {'title': 'Lingkungan', 'icon': Icons.park_outlined},
    {'title': 'Kegiatan Sosial', 'icon': Icons.groups_outlined},
    {'title': 'Infrastruktur Umum', 'icon': Icons.apartment_outlined},
    {'title': 'Karya Kreatif & Modal Usaha', 'icon': Icons.storefront_outlined},
    {'title': 'Panti Asuhan', 'icon': Icons.family_restroom_rounded},
    {'title': 'Tempat Ibadah', 'icon': Icons.mosque_outlined},
    {'title': 'Menolong Hewan', 'icon': Icons.pets_outlined},
    {'title': 'Difabel', 'icon': Icons.accessible_rounded},
  ];

  final List<Map<String, dynamic>> _pilihanBenevo = [
    {
      'title': 'Pengecoran Jalan Desa Purukan',
      'image': 'assets/images/campaigns/c1_jalan.png',
      'organizer': 'Benevo',
      'progress': 0.72,
      'amount': 'Rp128.000.000',
    },
    {
      'title': 'Pengobatan Bayi Stunting',
      'image': 'assets/images/campaigns/c2_bayi.png',
      'organizer': 'Benevo',
      'progress': 0.54,
      'amount': 'Rp45.000.000',
    },
  ];

  final List<Map<String, dynamic>> _penggalanganLainnya = [
    {
      'title': 'Bantuan Dana untuk Penderita Penyakit Kanker',
      'image': 'assets/images/campaigns/c1_kanker.png',
      'organizer': 'Benevo',
      'collected': 'Rp314.521.780',
      'daysLeft': '79',
    },
    {
      'title': 'Penanaman 250.000 Pohon di Sumatra',
      'image': 'assets/images/campaigns/c2_pohon.png',
      'organizer': 'Benevo',
      'collected': 'Rp3.462.970.128',
      'daysLeft': '48',
    },
    {
      'title': 'Sedekah untuk Kebutuhan Panti Asuhan di Kalimantan Timur',
      'image': 'assets/images/campaigns/c3_panti.png',
      'organizer': 'Benevo',
      'collected': 'Rp685.342.117',
      'daysLeft': '48',
    },
  ];

  void _openCategory(String categoryTitle) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryCampaignsScreen(categoryTitle: categoryTitle),
      ),
    );
  }

  void _openSearch() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SearchScreen(),
      ),
    );
  }

  void _openSort() async {
    final result = await Navigator.of(context).push<SortOption>(
      MaterialPageRoute(
        builder: (_) => SortScreen(initialSort: _currentSort),
      ),
    );
    if (result != null) {
      setState(() => _currentSort = result);
    }
  }

  void _openFilter() async {
    final result = await Navigator.of(context).push<Map<String, bool>>(
      MaterialPageRoute(
        builder: (_) => FilterScreen(
          initialOlehBenevo: _olehBenevo,
          initialDigalangYayasan: _digalangYayasan,
          initialDigalangPublik: _digalangPublik,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        _olehBenevo = result['olehBenevo'] ?? true;
        _digalangYayasan = result['digalangYayasan'] ?? true;
        _digalangPublik = result['digalangPublik'] ?? false;
      });
    }
  }

  void _openCampaignDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CampaignDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Lavender purple gradient behind the categories area
          Container(
            height: 380,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFBCABE4),
                  Color(0xFFBFAFE6),
                  Color(0xFFDDD3F0),
                  Colors.white,
                ],
                stops: [0.0, 0.45, 0.80, 1.0],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),

                  // TOP BAR: Profile Icon + Search Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // Profile Avatar Icon
                        GestureDetector(
                          onTap: widget.onProfileTap,
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person_outline_rounded,
                              color: Color(0xFF5B33A7),
                              size: 22,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Search Input (Tap opens Screen 5 SearchScreen)
                        Expanded(
                          child: GestureDetector(
                            onTap: _openSearch,
                            child: Container(
                              height: 38,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.05),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search_rounded,
                                    color: Color(0xFF867E96),
                                    size: 19,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'cari yang ingin kamu bantu',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF867E96),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // SECTION 1: "Berdonasi untuk membantu sesama"
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Berdonasi untuk membantu sesama',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2C2438),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // 12 CATEGORIES GRID (3 rows x 4 columns)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 6,
                        childAspectRatio: 0.84,
                      ),
                      itemBuilder: (context, index) {
                        final cat = _categories[index];
                        return GestureDetector(
                          onTap: () => _openCategory(cat['title'] as String),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  cat['icon'] as IconData,
                                  color: const Color(0xFF5B33A7),
                                  size: 22,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                cat['title'] as String,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 9.8,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2C2438),
                                  height: 1.15,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 18),

                  // SECTION 2: "Pilihan Benevo"
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Pilihan Benevo',
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2C2438),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Horizontal Cards Row for "Pilihan Benevo"
                  SizedBox(
                    height: 172,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: _pilihanBenevo.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final item = _pilihanBenevo[index];
                        return _buildPilihanBenevoCard(item);
                      },
                    ),
                  ),

                  const SizedBox(height: 22),

                  // SECTION 3: "Penggalangan Dana Lainnya"
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Penggalangan Dana Lainnya',
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2C2438),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Filter & Sort Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // Urutkan Button
                        _buildSmallFilterButton(
                          icon: Icons.swap_vert_rounded,
                          label: 'Urutkan',
                          onTap: _openSort,
                        ),
                        const SizedBox(width: 8),

                        // Filter Button
                        _buildSmallFilterButton(
                          icon: Icons.tune_rounded,
                          label: 'Filter',
                          onTap: _openFilter,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // List of "Penggalangan Dana Lainnya"
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _penggalanganLainnya.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = _penggalanganLainnya[index];
                      return _buildOtherCampaignCard(item);
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallFilterButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFDED8EA)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: const Color(0xFF5B33A7)),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C2438),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPilihanBenevoCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: _openCampaignDetail,
      child: Container(
        width: 148,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFEDE8F5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                item['image'] as String,
                height: 84,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 84,
                  color: const Color(0xFFE8E4F0),
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Benevo',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5B33A7),
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(
                        Icons.verified_rounded,
                        color: Color(0xFF5B33A7),
                        size: 11,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item['title'] as String,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F1A28),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: item['progress'] as double,
                      minHeight: 4,
                      backgroundColor: const Color(0xFFEBE6F3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF5B33A7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherCampaignCard(Map<String, dynamic> item) {
    return InkWell(
      onTap: _openCampaignDetail,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['image'] as String,
                width: 95,
                height: 68,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 95,
                  height: 68,
                  color: const Color(0xFFE8E4F0),
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Right Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] as String,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F1A28),
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        item['organizer'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5B33A7),
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(
                        Icons.verified_rounded,
                        color: Color(0xFF5B33A7),
                        size: 13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Terkumpul',
                            style: TextStyle(
                              fontSize: 9.5,
                              color: Color(0xFF867E94),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            item['collected'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF5B33A7),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Sisa Hari',
                            style: TextStyle(
                              fontSize: 9.5,
                              color: Color(0xFF867E94),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            item['daysLeft'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF5B33A7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
