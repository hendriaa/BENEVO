import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../widgets/campaign_card.dart';
import '../widgets/category_item.dart';
import '../widgets/benevo_bottom_nav_bar.dart';
import '../../donation/screens/campaign_detail_screen.dart';
import '../../donation/models/campaign_model.dart';
import '../../donation/screens/donation_catalog_screen.dart';
import '../../inbox/screens/inbox_screen.dart';
import '../../fundraiser/screens/fundraiser_screen.dart';
import '../../auth/widgets/incognito_icon.dart';
import '../../auth/screens/login_screen.dart';
import '../../profile/screens/edit_profile_screen.dart';
import 'category_campaigns_screen.dart';
import 'search_screen.dart';

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
  final ScrollController _categoryScrollController = ScrollController();
  late String _profileUserName;
  String _profileHandle = '@hn.zell_';

  @override
  void initState() {
    super.initState();
    _profileUserName = widget.userName;
  }

  final List<String> _filters = [
    'Semua',
    'Darurat & Bencana',
    'Kesehatan',
  ];

  final List<Map<String, dynamic>> _categories = const [
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

  void _scrollCategoriesRight() {
    if (_categoryScrollController.hasClients) {
      final maxScroll = _categoryScrollController.position.maxScrollExtent;
      final currentScroll = _categoryScrollController.offset;
      if (currentScroll >= maxScroll - 10) {
        _categoryScrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      } else {
        final targetScroll = (currentScroll + 240).clamp(0.0, maxScroll);
        _categoryScrollController.animateTo(
          targetScroll,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
        );
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _categoryScrollController.dispose();
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
          DonationCatalogScreen(
            onProfileTap: () {
              setState(() {
                _currentNavIndex = 4;
              });
            },
          ),
          InboxScreen(
            onBackToHome: () {
              setState(() {
                _currentNavIndex = 0;
              });
            },
          ),
          FundraiserScreen(
            onBackToHome: () {
              setState(() {
                _currentNavIndex = 0;
              });
            },
          ),
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
        // Background Gradient (purple top gracefully fading to white background)
        Container(
          height: 380,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF8E6FB7),
                Color(0xFFA78BCB),
                Color(0xFFC7B4DF),
                Color(0xFFEAE2F4),
                Colors.white,
              ],
              stops: [0.0, 0.28, 0.55, 0.82, 1.0],
            ),
          ),
        ),

        SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),

                // Top Header: Profile Avatar, Search Bar & Wallet Balance Pill
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      // Profile Avatar
                      GestureDetector(
                        onTap: () => _showNotification('Membuka profil $displayName'),
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
                          child: const Center(
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: Color(0xFF756F82),
                              size: 21,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Search Bar
                      Expanded(
                        child: Container(
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _searchController,
                            readOnly: true,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SearchScreen(),
                                ),
                              );
                            },
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: AppColors.textPrimary,
                            ),
                            decoration: const InputDecoration(
                              hintText: 'cari kampanye...',
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF9E98AA),
                                fontWeight: FontWeight.w400,
                              ),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Color(0xFF8E889C),
                                size: 20,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      // Balance Badge: Rp 25.000
                      Container(
                        height: 38,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF9D84D),
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Text(
                                  'Rp',
                                  style: TextStyle(
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              '25.000',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF5D5769),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Greeting Section & Donation Summary Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC7B6E4).withValues(alpha: 0.45),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.45),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF53388A).withValues(alpha: 0.06),
                          blurRadius: 16,
                          offset: const Offset(0, 4),
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
                            color: Color(0xFF381F68),
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'Terima Kasih atas kebaikanmu yang terus mengalir',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Color(0xFF5C4978),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Donation Summary Row
                        Row(
                          children: [
                            // Bare Heart Icon
                            const Icon(
                              Icons.favorite_border_rounded,
                              color: Color(0xFF4C2F82),
                              size: 32,
                            ),

                            const SizedBox(width: 12),

                            // Amount & Label
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Donasi yang telah anda salurkan',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF594575),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'RP 5.600.000',
                                    style: TextStyle(
                                      fontSize: 18.5,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFF351D5C),
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Right status: "26 kampanye" + Green Checkmark "Tersalurkan"
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 7,
                                    vertical: 2.5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF7DD56),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    '26 kampanye',
                                    style: TextStyle(
                                      fontSize: 8.5,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF45380A),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 19,
                                      height: 19,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF67BB6A),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      'Tersalurkan',
                                      style: TextStyle(
                                        fontSize: 7.5,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF382359),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Horizontal Filter Tabs ("Semua", "Darurat & Bencana", "Kesehatan")
                SizedBox(
                  height: 36,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _filters.length,
                    itemBuilder: (context, index) {
                      final isSelected = _selectedFilterIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
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
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF503287)
                                  : const Color(0xFFEDE4F8),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF503287)
                                    : const Color(0xFFD4C7EC),
                                width: 1.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _filters[index],
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF4C3E68),
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
                          // Main Featured Image with Tag Badges
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(22),
                            ),
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/campaigns/s2_ntt.png',
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
                                // Bottom-left Tag: "Hingga 03/10/2030"
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
                                      'Hingga 03/10/2030',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF4A3B05),
                                      ),
                                    ),
                                  ),
                                ),
                                // Bottom-right Tag: "9.610 Donatur"
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1E172C).withValues(alpha: 0.65),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      '9.610 Donatur',
                                      style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
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
                                      Color(0xFF502E88),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 8),

                                // Donation Stats (Stacked)
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Donasi:',
                                      style: TextStyle(
                                        fontSize: 11.5,
                                        color: Color(0xFF756F82),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      'RP 566.000.000 / 1.000.000.000',
                                      style: TextStyle(
                                        fontSize: 14.5,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF321B59),
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
                                                    const CampaignDetailScreen(
                                                  openDonationImmediately: true,
                                                ),
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
                          onPressed: _scrollCategoriesRight,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Category Items Horizontal Scroll
                  SizedBox(
                    height: 104,
                    child: ListView.separated(
                      controller: _categoryScrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: _categories.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final category = _categories[index];
                        final title = category['title'] as String;
                        final icon = category['icon'] as IconData;

                        return CategoryItem(
                          title: title,
                          icon: icon,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CategoryCampaignsScreen(
                                  categoryTitle: title,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Secondary Campaigns (Bottom Cards)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SecondaryCampaignCard(
                            title: 'Bantuan Sekolah terpelosok di Maluku Utara',
                            tag: 'Tercapai',
                            imageAsset: 'assets/images/campaigns/s5_pendidikan.png',
                            currentAmount: 131000000,
                            targetAmount: 134000000,
                            statusLabel: 'Terkumpul',
                            rightLabel: 'Sisa Hari',
                            rightValue: '3',
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
                                          'assets/images/campaigns/s5_pendidikan.png',
                                      currentAmount: 131000000,
                                      targetAmount: 134000000,
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
                            tag: 'Hingga 20/10/2034',
                            imageAsset: 'assets/images/campaigns/s2_anak_ntt.png',
                            currentAmount: 121000000,
                            targetAmount: 134000000,
                            statusLabel: 'Tersedia',
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
                                          'assets/images/campaigns/s2_anak_ntt.png',
                                      currentAmount: 121000000,
                                      targetAmount: 134000000,
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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Yakin Anda mau Keluar dari\nAplikasi?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2C1952),
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(ctx),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(color: AppColors.primary, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Batal',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF482D79),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        'Keluar',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTab(String displayName) {
    final isAnonymous = widget.isAnonymous;

    return Column(
      children: [
        // Solid Purple Header "Informasi Akun" with back arrow
        Container(
          color: AppColors.primary,
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: 56,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _currentNavIndex = 0; // Return to Home tab
                      });
                    },
                  ),
                  const Text(
                    'Informasi Akun',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Profile details card (White background)
        Expanded(
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  // Avatar
                  if (isAnonymous)
                    Container(
                      width: 96,
                      height: 96,
                      decoration: const BoxDecoration(
                        color: Color(0xFFA5A5A5),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: IncognitoIcon(
                          size: 56,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    Container(
                      width: 96,
                      height: 96,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD6D6D6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFF757575),
                        size: 56,
                      ),
                    ),

                  const SizedBox(height: 14),

                  // Username / Display Name
                  Text(
                    isAnonymous ? 'Anonymous #03' : _profileUserName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF333333),
                      letterSpacing: -0.3,
                    ),
                  ),

                  // If logged in: Show handle and "Edit Profil" button
                  if (!isAnonymous) ...[
                    const SizedBox(height: 3),
                    Text(
                      _profileHandle,
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF8E8E93),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => EditProfileScreen(
                              currentName: _profileUserName,
                              currentHandle: _profileHandle,
                            ),
                          ),
                        );
                        if (result != null && result is Map<String, dynamic>) {
                          setState(() {
                            if (result['name'] != null) {
                              _profileUserName = result['name'];
                            }
                            if (result['handle'] != null) {
                              _profileHandle = result['handle'];
                            }
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF40286E),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF40286E).withValues(alpha: 0.28),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit_outlined,
                              size: 13.5,
                              color: Colors.white,
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Edit Profil',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Thick Divider Separator (8px light grey bar)
                  Container(
                    height: 8,
                    width: double.infinity,
                    color: const Color(0xFFE8E8EC),
                  ),

                  // "Log Out" Item
                  InkWell(
                    onTap: _showLogoutDialog,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.logout_rounded,
                            color: AppColors.primary,
                            size: 22,
                          ),
                          const SizedBox(width: 14),
                          const Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFD32F2F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F3)),

                  const SizedBox(height: 90), // Bottom padding for floating nav bar
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
