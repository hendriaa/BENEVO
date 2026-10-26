import 'package:flutter/material.dart';
import '../../donation/screens/campaign_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _recentSearches = [
    'Pengobatan Balita',
    'DARURAT Bantu Korban Gempa NTT',
    'Infrastruktur Jalan Desa',
  ];

  final List<String> _keywordChips = [
    'Balita',
    'Palestina',
    'Yatim',
    'Petani',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _removeRecentSearch(int index) {
    setState(() {
      _recentSearches.removeAt(index);
    });
  }

  void _clearAllRecentSearches() {
    setState(() {
      _recentSearches.clear();
    });
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
        titleSpacing: 0,
        title: Container(
          height: 38,
          margin: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            autofocus: false,
            decoration: const InputDecoration(
              hintText: 'cari yang ingin kamu bantu',
              hintStyle: TextStyle(
                fontSize: 13,
                color: Color(0xFF9E98A8),
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Color(0xFF9E98A8),
                size: 20,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 9),
            ),
            style: const TextStyle(
              fontSize: 13.5,
              color: Color(0xFF2C2438),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. RIWAYAT PENCARIAN
              const Text(
                'Riwayat Pencarian',
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2C2438),
                ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pencarian Terakhir',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C2438),
                    ),
                  ),
                  if (_recentSearches.isNotEmpty)
                    GestureDetector(
                      onTap: _clearAllRecentSearches,
                      child: const Text(
                        'Hapus Semua',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE53935),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Recent searches list
              if (_recentSearches.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Tidak ada pencarian terakhir',
                    style: TextStyle(fontSize: 12.5, color: Color(0xFF9E98A8)),
                  ),
                )
              else
                Column(
                  children: List.generate(_recentSearches.length, (index) {
                    final item = _recentSearches[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _searchController.text = item;
                              },
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF5A5265),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _removeRecentSearch(index),
                            child: const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.close_rounded,
                                size: 16,
                                color: Color(0xFF9E98A8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),

              const SizedBox(height: 18),

              // Terakhir Dilihat
              const Text(
                'Terakhir Dilihat',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C2438),
                ),
              ),
              const SizedBox(height: 10),

              // Horizontal thumbnail list
              SizedBox(
                height: 64,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildRecentThumbnail(
                      'assets/images/campaigns/s2_ntt.png',
                      () => _openCampaign('DARURAT!!! WARGA NTT BUTUH PERTOLONGAN'),
                    ),
                    _buildRecentThumbnail(
                      'assets/images/campaigns/c1_jalan.png',
                      () => _openCampaign('Pengecoran Jalan Desa Purukan'),
                    ),
                    _buildRecentThumbnail(
                      'assets/images/campaigns/c2_bayi.png',
                      () => _openCampaign('Pengobatan Bayi Stunting'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Divider(height: 1, thickness: 1, color: Color(0xFFECE7F4)),
              const SizedBox(height: 20),

              // 2. PENCARIAN PILIHAN
              const Text(
                'Pencarian Pilihan',
                style: TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2C2438),
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'Kata Kunci',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF867E94),
                ),
              ),
              const SizedBox(height: 8),

              // Keyword chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _keywordChips.map((chip) {
                  return GestureDetector(
                    onTap: () {
                      _searchController.text = chip;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xFFD6CDE6),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        chip,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4A4254),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 18),

              // Recommendation Items
              _buildRecommendationItem(
                imagePath: 'assets/images/campaigns/s5_petani.png',
                title: 'Dukung Petani Perempuan Indonesia Berdaya',
                onTap: () => _openCampaign('Dukung Petani Perempuan Indonesia Berdaya'),
              ),
              const SizedBox(height: 10),
              _buildRecommendationItem(
                imagePath: 'assets/images/campaigns/s5_pendidikan.png',
                title: 'Bantu Akses Pendidikan Anak di NTT',
                onTap: () => _openCampaign('Bantu Akses Pendidikan Anak di NTT'),
              ),
              const SizedBox(height: 10),
              _buildRecommendationItem(
                imagePath: 'assets/images/campaigns/s5_palestina.png',
                title: 'Sembako Selamatkan Saudara kita di Palestina',
                onTap: () => _openCampaign('Sembako Selamatkan Saudara kita di Palestina'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentThumbnail(String path, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 88,
        height: 64,
        margin: const EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: const Color(0xFFE8E4F0),
              child: const Icon(Icons.image_outlined, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationItem({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 72,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 72,
                  height: 48,
                  color: const Color(0xFFE8E4F0),
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C2438),
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Text(
                        'Benevo',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF5B33A7),
                        ),
                      ),
                      SizedBox(width: 3),
                      Icon(
                        Icons.verified_rounded,
                        color: Color(0xFF5B33A7),
                        size: 13,
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

  void _openCampaign(String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const CampaignDetailScreen(),
      ),
    );
  }
}
