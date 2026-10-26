import 'package:flutter/material.dart';
import '../../donation/screens/campaign_detail_screen.dart';
import 'sort_screen.dart';
import 'filter_screen.dart';

class CategoryCampaignsScreen extends StatefulWidget {
  final String categoryTitle;

  const CategoryCampaignsScreen({
    super.key,
    this.categoryTitle = 'Bencana Alam',
  });

  @override
  State<CategoryCampaignsScreen> createState() =>
      _CategoryCampaignsScreenState();
}

class _CategoryCampaignsScreenState extends State<CategoryCampaignsScreen> {
  SortOption _currentSort = SortOption.palingMendesak;
  bool _olehBenevo = true;
  bool _digalangYayasan = true;
  bool _digalangPublik = false;

  final List<Map<String, dynamic>> _allCampaigns = [
    {
      'title': 'DARURAT!!! WARGA NTT BUTUH PERTOLONGAN',
      'image': 'assets/images/campaigns/s2_ntt.png',
      'organizer': 'Benevo',
      'collected': 'Rp467.325.098',
      'daysLeft': '3',
      'source': 'benevo',
    },
    {
      'title': 'Darurat Karhutla Kalimantan',
      'image': 'assets/images/campaigns/s2_karhutla.png',
      'organizer': 'Benevo',
      'collected': 'Rp26.821.440',
      'daysLeft': '13',
      'source': 'yayasan',
    },
    {
      'title':
          'Bantuan Pengungsian Masyarakat terkena Abu Vulkanik Anak Krakatau',
      'image': 'assets/images/campaigns/s2_abu.png',
      'organizer': 'Benevo',
      'collected': 'Rp26.821.440',
      'daysLeft': '2',
      'source': 'benevo',
    },
    {
      'title': 'Bantuan Keselamatan Korban Banjir Bandang Aceh',
      'image': 'assets/images/campaigns/s2_banjir.png',
      'organizer': 'Benevo',
      'collected': 'Rp112.776.230',
      'daysLeft': '15',
      'source': 'yayasan',
    },
    {
      'title': 'Bantu Pulihkan Anak-Anak Korban Gempa NTT',
      'image': 'assets/images/campaigns/s2_anak_ntt.png',
      'organizer': 'Benevo',
      'collected': 'Rp26.821.440',
      'daysLeft': '21',
      'source': 'publik',
    },
  ];

  void _openSort() async {
    final result = await Navigator.of(context).push<SortOption>(
      MaterialPageRoute(
        builder: (_) => SortScreen(initialSort: _currentSort),
      ),
    );
    if (result != null) {
      setState(() {
        _currentSort = result;
      });
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
        title: Text(
          widget.categoryTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Filter Bar with 3 action buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFEBE7F2), width: 1),
              ),
            ),
            child: Row(
              children: [
                // Kategori pill
                Expanded(
                  child: _buildFilterBarButton(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Kategori: ${widget.categoryTitle}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: Icons.grid_view_rounded,
                    label: 'Kategori',
                    hasActiveDot: true,
                  ),
                ),
                const SizedBox(width: 8),

                // Urutkan pill
                Expanded(
                  child: _buildFilterBarButton(
                    onTap: _openSort,
                    icon: Icons.swap_vert_rounded,
                    label: 'Urutkan',
                    hasActiveDot: false,
                  ),
                ),
                const SizedBox(width: 8),

                // Filter pill
                Expanded(
                  child: _buildFilterBarButton(
                    onTap: _openFilter,
                    icon: Icons.tune_rounded,
                    label: 'Filter',
                    hasActiveDot: false,
                  ),
                ),
              ],
            ),
          ),

          // List of Campaign cards
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              itemCount: _allCampaigns.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final item = _allCampaigns[index];
                return _buildCampaignCard(item);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBarButton({
    required VoidCallback onTap,
    required IconData icon,
    required String label,
    required bool hasActiveDot,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFDED8EA)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF5B33A7)),
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C2438),
              ),
            ),
            if (hasActiveDot) ...[
              const SizedBox(width: 4),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF5B33A7),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignCard(Map<String, dynamic> item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const CampaignDetailScreen(),
          ),
        );
      },
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
