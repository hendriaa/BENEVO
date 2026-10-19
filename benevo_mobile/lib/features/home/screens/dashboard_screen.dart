import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../widgets/campaign_card.dart';
import '../widgets/category_item.dart';
import '../widgets/benevo_bottom_nav_bar.dart';
import '../../donation/screens/campaign_detail_screen.dart';
import '../../donation/models/campaign_model.dart';

class DashboardScreen extends StatefulWidget {
  final String userName;
  final bool isAnonymous;

  const DashboardScreen({
    super.key,
    this.userName = 'Hanzel',
    this.isAnonymous = false,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedFilterIndex = 0;
  int _currentNavIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<String> _filters = [
    'Semua',
    'Darurat & Bencana',
    'Kesehatan',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showNotification(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayName = widget.isAnonymous ? 'Donatur' : widget.userName;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _currentNavIndex,
        children: [
          _buildHomeTab(displayName),
          const CampaignDetailScreen(isEmbeddedInDashboard: true),
          _buildHistoryTab(),
          _buildProfileTab(displayName),
        ],
      ),
      bottomNavigationBar: BenevoBottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildHomeTab(String displayName) {
    return Stack(
      children: [
        // Background Gradient (purple top fading to background)
        Container(
          height: 340,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF9A7EC4),
                Color(0xFFB19ACF),
                Color(0xFFDED2EE),
                AppColors.background,
              ],
              stops: [0.0, 0.35, 0.75, 1.0],
            ),
          ),
        ),

        SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Top Header: Profile Avatar & Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      // Profile Avatar
                      GestureDetector(
                          onTap: () => _showNotification('Membuka profil $displayName'),
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.08),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person_outline_rounded,
                                color: AppColors.primary,
                                size: 24,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Search Bar
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _searchController,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.textPrimary,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'cari yang ingin kamu bantu',
                                hintStyle: TextStyle(
                                  fontSize: 12.5,
                                  color: Color(0xFF9E99AA),
                                ),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Color(0xFF867E96),
                                  size: 21,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Greeting Section & Donation Summary Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.88),
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "Halo, Hanzel"
                          Text(
                            'Halo, $displayName',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF321E54),
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            'Terima kasih atas kebaikanmu yang terus mengalir',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF5E5074),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 14),

                          // Donation Summary Box
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F4FB),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFFE9E2F4),
                                width: 1.2,
                              ),
                            ),
                            child: Row(
                              children: [
                                // Heart Icon Badge
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEADBFC),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.primary.withValues(alpha: 0.2),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.favorite_border_rounded,
                                      color: AppColors.primary,
                                      size: 22,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Amount & Label
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Donasi yang telah anda salurkan :',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'RP 5.600.000',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF381F63),
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Right status: "14 campaign" + 100% check badge
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 7,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFDE87B),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text(
                                        '14 campaign',
                                        style: TextStyle(
                                          fontSize: 9.5,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xFF4C3D05),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 18,
                                          height: 18,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF4CAF50),
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '100%',
                                          style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF2E7D32),
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
                  ),

                  const SizedBox(height: 18),

                  // Horizontal Filter Tabs ("Semua", "Darurat & Bencana", "Kesehatan")
                  SizedBox(
                    height: 38,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _filters.length,
                      itemBuilder: (context, index) {
                        final isSelected = _selectedFilterIndex == index;
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedFilterIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? AppColors.primary
                                      : const Color(0xFFD6CDE5),
                                  width: 1.2,
                                ),
                                boxShadow: [
                                  if (isSelected)
                                    BoxShadow(
                                      color: AppColors.primary
                                          .withValues(alpha: 0.35),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  _filters[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF5A4D73),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Featured Campaign Card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const CampaignDetailScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.10),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main Featured Image with Tag
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(22),
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  'https://images.unsplash.com/photo-1547082299-de196ea013d6?w=800',
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    height: 180,
                                    color: const Color(0xFFD9D0EB),
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_rounded,
                                        size: 48,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFDE87B),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'DARURAT & BENCANA',
                                      style: TextStyle(
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF4A3B05),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                const Text(
                                  'Bantuan Bencana Gempa NTT: Sandang, Pangan, Papan',
                                  style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.textPrimary,
                                    height: 1.3,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                // Organizer Line
                                const Row(
                                  children: [
                                    Text(
                                      'Benevo',
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.verified_rounded,
                                      color: AppColors.primary,
                                      size: 14,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                // Progress Bar
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: const LinearProgressIndicator(
                                    value: 0.566,
                                    minHeight: 7,
                                    backgroundColor: Color(0xFFEFEAF7),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.primary,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // Donation Stats
                                const Row(
                                  children: [
                                    Text(
                                      'Total Donasi: ',
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        color: AppColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'RP 566.000.000 / 1.000.000.000',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF331D56),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 14),

                                // Action Buttons: "Berdonasi", Share, Flag
                                Row(
                                  children: [
                                    // "Berdonasi" button
                                    Expanded(
                                      child: SizedBox(
                                        height: 46,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    const CampaignDetailScreen(),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            foregroundColor: Colors.white,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Berdonasi',
                                                style: TextStyle(
                                                  fontSize: 14.5,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Icon(
                                                Icons.favorite_border_rounded,
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    // Share button
                                    Container(
                                      width: 46,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF8F7EBA),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.share_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        onPressed: () => _showNotification(
                                          'Bagikan kampanye Bencana NTT',
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 8),

                                    // Flag / Report button
                                    Container(
                                      width: 46,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEDE9F5),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.outlined_flag_rounded,
                                          color: Color(0xFF5E5175),
                                          size: 20,
                                        ),
                                        onPressed: () => _showNotification(
                                          'Laporkan kampanye ini',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                  const SizedBox(height: 24),

                  // Categories Section Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kategori Yang dapat kamu pilih',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            letterSpacing: -0.2,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textSecondary,
                            size: 24,
                          ),
                          onPressed: () => _showNotification('Melihat semua kategori'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Category Items Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CategoryItem(
                          title: 'Bencana Alam',
                          icon: Icons.flood_outlined,
                          onTap: () => _showNotification('Kategori Bencana Alam'),
                        ),
                        CategoryItem(
                          title: 'Balita & Anak Sakit',
                          icon: Icons.child_care_rounded,
                          onTap: () => _showNotification('Kategori Balita & Anak Sakit'),
                        ),
                        CategoryItem(
                          title: 'Bantuan & Medis',
                          icon: Icons.medical_services_outlined,
                          onTap: () => _showNotification('Kategori Bantuan & Medis'),
                        ),
                        CategoryItem(
                          title: 'Bantuan Pendidikan',
                          icon: Icons.school_outlined,
                          onTap: () => _showNotification('Kategori Bantuan Pendidikan'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Secondary Campaigns (Bottom Cards)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SecondaryCampaignCard(
                            title: 'Bantuan Sekolah terpelosok di Maluku Utara',
                            category: 'PENDIDIKAN',
                            imageUrl:
                                'https://images.unsplash.com/photo-1577896851231-70ef18881754?w=500',
                            currentAmount: 15000000,
                            targetAmount: 75000000,
                            daysLeft: '12 hari lagi',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const CampaignDetailScreen(
                                    campaign: CampaignModel(
                                      id: 'campaign_maluku',
                                      title:
                                          'Bantuan Sekolah terpelosok di Maluku Utara',
                                      category: 'PENDIDIKAN',
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1577896851231-70ef18881754?w=500',
                                      currentAmount: 15000000,
                                      targetAmount: 75000000,
                                      donorsCount: 420,
                                      updatesCount: 3,
                                      disbursementsCount: 1,
                                      organizerName: 'Yayasan Peduli Maluku',
                                      organizerAvatarUrl:
                                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
                                      storyDate: '12 September 2026',
                                      storyContent:
                                          'Bantuan fasilitas pendidikan, perbaikan ruang kelas, dan perlengkapan belajar bagi murid di Halmahera.',
                                      urgentNeeds: [
                                        UrgentNeed(
                                          title: 'Buku Pelajaran',
                                          iconType: 'book',
                                        ),
                                        UrgentNeed(
                                          title: 'Seragam Sekolah',
                                          iconType: 'clothes',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: SecondaryCampaignCard(
                            title:
                                'Bantuan Infrastruktur Sekolah Prihatinkan di Papua Barat',
                            category: 'INFRASTRUKTUR',
                            imageUrl:
                                'https://images.unsplash.com/photo-1509062522246-3755977927d7?w=500',
                            currentAmount: 24500000,
                            targetAmount: 100000000,
                            daysLeft: '28 hari lagi',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const CampaignDetailScreen(
                                    campaign: CampaignModel(
                                      id: 'campaign_papua',
                                      title:
                                          'Bantuan Infrastruktur Sekolah Prihatinkan di Papua Barat',
                                      category: 'INFRASTRUKTUR',
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1509062522246-3755977927d7?w=500',
                                      currentAmount: 24500000,
                                      targetAmount: 100000000,
                                      donorsCount: 890,
                                      updatesCount: 5,
                                      disbursementsCount: 2,
                                      organizerName: 'Komunitas Peduli Papua',
                                      organizerAvatarUrl:
                                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
                                      storyDate: '5 Oktober 2026',
                                      storyContent:
                                          'Pembangunan ruang kelas baru dan jembatan penyeberangan aman untuk anak-anak sekolah di pedalaman Papua Barat.',
                                      urgentNeeds: [
                                        UrgentNeed(
                                          title: 'Bahan Bangunan',
                                          iconType: 'building',
                                        ),
                                        UrgentNeed(
                                          title: 'Fasilitas Air',
                                          iconType: 'water',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 90), // Bottom padding for floating nav bar
                ],
              ),
            ),
          ),
        ],
      );
  }

  Widget _buildHistoryTab() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Riwayat Donasi',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF321E54),
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Daftar kebaikan yang telah kamu salurkan',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF6B5E82),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEADBFC),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.favorite_rounded,
                            color: AppColors.primary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bantuan Gempa NTT',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF332052),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '15 Okt 2026 • QRIS • Berhasil',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF8B829D),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Rp100.000',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
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

  Widget _buildProfileTab(String displayName) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFEADBFC),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.person_rounded,
                  color: AppColors.primary,
                  size: 42,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              displayName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF321E54),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'donatur.baik@benevo.id',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF7A6E91),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.06),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person_outline_rounded, color: AppColors.primary),
                      title: const Text('Edit Profil', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () => _showNotification('Fitur Edit Profil'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.notifications_none_rounded, color: AppColors.primary),
                      title: const Text('Notifikasi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () => _showNotification('Fitur Notifikasi'),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.security_rounded, color: AppColors.primary),
                      title: const Text('Keamanan Akun', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      trailing: const Icon(Icons.chevron_right_rounded),
                      onTap: () => _showNotification('Fitur Keamanan'),
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
