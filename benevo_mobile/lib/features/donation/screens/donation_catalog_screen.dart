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

  final List<String> _categories = const [
    'Bencana Alam',
    'Balita & Anak Sakit',
    'Bantuan & Medis',
    'Bantuan Pendidikan',
    'Lingkungan',
    'Kegiatan Sosial',
    'Infrastruktur Umum',
    'Karya Kreatif & Modal Usaha',
    'Panti Asuhan',
    'Tempat Ibadah',
    'Menolong Hewan',
    'Difabel',
  ];

  final List<Map<String, dynamic>> _pilihanBenevo = [
    {
      'title': 'Pengecoran Jalan Desa Purukan',
      'image': 'assets/images/campaigns/c1_jalan.png',
      'organizer': 'Benevo',
      'progress': 0.72,
      'amount': 'Rp 128.000.000',
    },
    {
      'title': 'Pengobatan Bayi Stunting',
      'image': 'assets/images/campaigns/c2_bayi.png',
      'organizer': 'Benevo',
      'progress': 0.54,
      'amount': 'Rp 45.000.000',
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
          // Lavender purple gradient behind top area
          Container(
            height: 430,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF8E73B9),
                  Color(0xFFA58ECB),
                  Color(0xFFDDD2EF),
                  Colors.white,
                ],
                stops: [0.0, 0.40, 0.75, 1.0],
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
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E1954),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // 12 CATEGORIES GRID (3 rows x 4 columns)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.82,
                      ),
                      itemBuilder: (context, index) {
                        final catTitle = _categories[index];
                        return GestureDetector(
                          onTap: () => _openCategory(catTitle),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildIllustratedCategoryCard(catTitle),
                              const SizedBox(height: 4),
                              Text(
                                catTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 9.8,
                                  fontWeight: FontWeight.w700,
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
                        fontSize: 16.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E1954),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Horizontal Cards Row for "Pilihan Benevo"
                  SizedBox(
                    height: 215,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: _pilihanBenevo.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 14),
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
                        fontSize: 16.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E1954),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Combined Filter & Sort Bar (Single card with divider)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFDED8EA)),
                      ),
                      child: Row(
                        children: [
                          // Urutkan Half
                          Expanded(
                            child: InkWell(
                              onTap: _openSort,
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(8),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.swap_vert_rounded,
                                    size: 18,
                                    color: Color(0xFF5B33A7),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Urutkan',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2C2438),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Vertical divider
                          const VerticalDivider(
                            width: 1,
                            thickness: 1,
                            color: Color(0xFFDED8EA),
                          ),

                          // Filter Half
                          Expanded(
                            child: InkWell(
                              onTap: _openFilter,
                              borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(8),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.tune_rounded,
                                    size: 17,
                                    color: Color(0xFF5B33A7),
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Filter',
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2C2438),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

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

  /// Illustrated Category Icon Card (matching user's two-tone purple & yellow illustration style)
  Widget _buildIllustratedCategoryCard(String title) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: _buildCategoryIconContent(title),
      ),
    );
  }

  Widget _buildCategoryIconContent(String title) {
    const purple = Color(0xFF5B33A7);
    const yellow = Color(0xFFF6C744);

    switch (title) {
      case 'Bencana Alam':
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: yellow,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const Icon(Icons.flood_rounded, color: purple, size: 26),
          ],
        );
      case 'Balita & Anak Sakit':
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: const BoxDecoration(
                color: Color(0xFFFEE685),
                shape: BoxShape.circle,
              ),
            ),
            const Icon(Icons.child_care_rounded, color: purple, size: 24),
            const Positioned(
              top: 5,
              right: 6,
              child: Icon(Icons.healing_rounded, color: yellow, size: 10),
            ),
          ],
        );
      case 'Bantuan & Medis':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.medical_services_rounded, color: purple, size: 24),
            Positioned(
              top: 4,
              right: 5,
              child: Icon(Icons.favorite_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Bantuan Pendidikan':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.school_rounded, color: purple, size: 25),
            Positioned(
              bottom: 4,
              right: 5,
              child: Icon(Icons.auto_stories_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Lingkungan':
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 5,
              right: 6,
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: yellow,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const Icon(Icons.eco_rounded, color: purple, size: 25),
          ],
        );
      case 'Kegiatan Sosial':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.inventory_2_rounded, color: purple, size: 24),
            Positioned(
              top: 4,
              right: 5,
              child: Icon(Icons.favorite_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Infrastruktur Umum':
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 6,
              child: Container(
                width: 22,
                height: 3,
                decoration: BoxDecoration(
                  color: yellow,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Icon(Icons.domain_rounded, color: purple, size: 24),
          ],
        );
      case 'Karya Kreatif & Modal Usaha':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.lightbulb_rounded, color: yellow, size: 27),
            Icon(Icons.auto_awesome_rounded, color: purple, size: 13),
          ],
        );
      case 'Panti Asuhan':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 3,
              child: Icon(Icons.roofing_rounded, color: yellow, size: 26),
            ),
            Positioned(
              bottom: 4,
              child: Icon(Icons.groups_rounded, color: purple, size: 21),
            ),
          ],
        );
      case 'Tempat Ibadah':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.mosque_rounded, color: purple, size: 24),
            Positioned(
              top: 4,
              right: 6,
              child: Icon(Icons.star_rounded, color: yellow, size: 11),
            ),
          ],
        );
      case 'Menolong Hewan':
        return const Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.pets_rounded, color: purple, size: 24),
            Positioned(
              top: 5,
              right: 5,
              child: Icon(Icons.pets_rounded, color: yellow, size: 12),
            ),
          ],
        );
      case 'Difabel':
        return Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.accessible_forward_rounded, color: purple, size: 25),
            Positioned(
              bottom: 6,
              right: 6,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: yellow, width: 2.2),
                ),
              ),
            ),
          ],
        );
      default:
        return const Icon(Icons.category_rounded, color: purple, size: 24);
    }
  }

  Widget _buildPilihanBenevoCard(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: _openCampaignDetail,
      child: Container(
        width: 172,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFEDE8F5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.asset(
                item['image'] as String,
                height: 98,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 98,
                  color: const Color(0xFFE8E4F0),
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Benevo',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5B33A7),
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(
                        Icons.verified_rounded,
                        color: Color(0xFF5B33A7),
                        size: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item['title'] as String,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F1A28),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['amount'] as String,
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5B33A7),
                    ),
                  ),
                  const SizedBox(height: 4),
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
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item['image'] as String,
                width: 120,
                height: 78,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 120,
                  height: 78,
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
                      fontSize: 12.5,
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
                        size: 12,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['collected'] as String,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF5B33A7),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Sisa Hari',
                            style: TextStyle(
                              fontSize: 9.5,
                              color: Color(0xFF867E96),
                            ),
                          ),
                          Text(
                            item['daysLeft'] as String,
                            style: const TextStyle(
                              fontSize: 13,
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
