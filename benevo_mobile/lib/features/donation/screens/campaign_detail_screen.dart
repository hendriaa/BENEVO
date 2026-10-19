import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../auth/widgets/benevo_logo.dart';
import '../models/campaign_model.dart';
import '../widgets/nominal_selection_bottom_sheet.dart';
import 'payment_screen.dart';

class CampaignDetailScreen extends StatefulWidget {
  final CampaignModel? campaign;
  final bool openDonationImmediately;
  final bool isEmbeddedInDashboard;

  const CampaignDetailScreen({
    super.key,
    this.campaign,
    this.openDonationImmediately = false,
    this.isEmbeddedInDashboard = false,
  });

  @override
  State<CampaignDetailScreen> createState() => _CampaignDetailScreenState();
}

class _CampaignDetailScreenState extends State<CampaignDetailScreen> {
  bool _isFavorite = false;
  late final CampaignModel _campaign;

  @override
  void initState() {
    super.initState();
    _campaign = widget.campaign ?? CampaignModel.nttEarthquakeCampaign;
    if (widget.openDonationImmediately) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _openDonationBottomSheet();
        }
      });
    }
  }

  String _formatCurrency(int val) {
    return 'RP ${val.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  void _openDonationBottomSheet() async {
    final selectedAmount = await NominalSelectionBottomSheet.show(
      context,
      initialAmount: 50000,
    );

    if (selectedAmount != null && mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PaymentScreen(
            campaignTitle: _campaign.title,
            initialAmount: selectedAmount,
          ),
        ),
      );
    }
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
    final c = _campaign;

    return Scaffold(
      backgroundColor: const Color(0xFFFBF9FD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: !widget.isEmbeddedInDashboard,
        leading: widget.isEmbeddedInDashboard
            ? null
            : IconButton(
                icon: const Icon(Icons.arrow_back_rounded,
                    color: AppColors.primaryDark),
                onPressed: () => Navigator.of(context).pop(),
              ),
        titleSpacing: widget.isEmbeddedInDashboard ? 20 : 0,
        title: Row(
          children: [
            const BenevoLogo(size: 28),
            const SizedBox(width: 8),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryDark,
                ),
                children: [
                  TextSpan(text: 'Benevo'),
                  TextSpan(
                    text: '•',
                    style: TextStyle(color: Color(0xFFEAB308)),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Color(0xFF5B457D)),
            onPressed: () => _showNotification('Membagikan program donasi...'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_rounded, color: Color(0xFF5B457D)),
            onPressed: () => _showNotification('Opsi program donasi'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Image
            Image.network(
              c.imageUrl,
              height: 230,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 230,
                color: const Color(0xFFDED2EE),
                child: const Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 60,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),

            // 2. Main Campaign Summary Card
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          c.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF26183B),
                            height: 1.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Favorite Button
                      InkWell(
                        onTap: () {
                          setState(() => _isFavorite = !_isFavorite);
                          _showNotification(
                            _isFavorite
                                ? 'Ditambahkan ke favorit'
                                : 'Dihapus dari favorit',
                          );
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFFE3DCED),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              _isFavorite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: _isFavorite
                                  ? const Color(0xFFE11D48)
                                  : const Color(0xFF7A6B8F),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  const Text(
                    'Tersedia',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF7D728E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),

                  Text(
                    '${_formatCurrency(c.currentAmount)} / ${c.targetAmount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Progress Bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: c.progressPercentage,
                      minHeight: 7,
                      backgroundColor: const Color(0xFFEFEAF7),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 3 Stats Columns
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Colors.grey.withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildStatItem(
                            icon: Icons.volunteer_activism_outlined,
                            title: c.donorsCount.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.'),
                            subtitle: 'Donasi',
                          ),
                        ),
                        Container(width: 1, height: 36, color: const Color(0xFFEBE5F2)),
                        Expanded(
                          child: _buildStatItem(
                            icon: Icons.receipt_long_outlined,
                            title: '',
                            subtitle: 'Kabar Terbaru',
                            singleLine: true,
                          ),
                        ),
                        Container(width: 1, height: 36, color: const Color(0xFFEBE5F2)),
                        Expanded(
                          child: _buildStatItem(
                            icon: Icons.account_balance_wallet_outlined,
                            title: '${c.disbursementsCount} kali',
                            subtitle: 'Pencairan Dana',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 3. Informasi Penggalangan Dana Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Penggalangan Dana',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Organizer Row
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          c.organizerAvatarUrl,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 48,
                            height: 48,
                            color: const Color(0xFFDED2EE),
                            child: const Icon(
                              Icons.person_rounded,
                              color: AppColors.primary,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              c.organizerName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF26183B),
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.verified_rounded,
                              color: AppColors.primary,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Menu Tiles: Rincian Penggunaan Dana & Kabar Terbaru
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFECE5F4)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        _buildOrganizerTile(
                          icon: Icons.account_balance_wallet_outlined,
                          title: 'Rincian Penggunaan Dana',
                          onTap: () => _showNotification('Rincian dana terbuka'),
                        ),
                        const Divider(height: 1, color: Color(0xFFECE5F4)),
                        _buildOrganizerTile(
                          icon: Icons.newspaper_outlined,
                          title: 'Kabar Terbaru',
                          onTap: () => _showNotification('Kabar terbaru terbuka'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 4. Cerita Penggalangan Dana Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cerita Penggalangan Dana',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c.storyDate,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: Color(0xFF8A7E9D),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    c.storyContent,
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF4C3E5F),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Mint Green "Kebutuhan Mendesak" Banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2F8EC),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFB9EED0)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Kebutuhan Mendesak',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0D5F3A),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildUrgentNeedItem(
                              title: 'Bantuan Makanan',
                              icon: Icons.lunch_dining_outlined,
                            ),
                            _buildUrgentNeedItem(
                              title: 'Pakaian Layak',
                              icon: Icons.checkroom_outlined,
                            ),
                            _buildUrgentNeedItem(
                              title: 'Perlengkapan Kebersihan',
                              icon: Icons.clean_hands_outlined,
                            ),
                            _buildUrgentNeedItem(
                              title: 'Obat-obatan',
                              icon: Icons.medication_outlined,
                            ),
                            _buildUrgentNeedItem(
                              title: 'Layanan Kesehatan',
                              icon: Icons.local_hospital_outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Steps Text
                  const Text(
                    'Mari bergandengan tangan membantu warga NTT yang terdampak gempa. Kamu bisa ikut berdonasi dengan cara:\n'
                    '1. Klik tombol \'DONASI SEKARANG\'\n'
                    '2. Masukkan nominal donasi\n'
                    '3. Pilih metode pembayaran\n'
                    '4. Segera transfer sesuai nominal jika menggunakan Transfer Bank atau Virtual Account.\n\n'
                    'Terima kasih atas kepedulian kalian, bantuan sekecil apa pun dapat menjadi dukungan berarti bagi warga yang sedang menghadapi situasi darurat.',
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF4C3E5F),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100), // Spacing for sticky bottom button
          ],
        ),
      ),

      // 5. Sticky Bottom Bar: "DONASI SEKARANG" Button
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: widget.isEmbeddedInDashboard ? 10 : 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: widget.isEmbeddedInDashboard
            ? SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: _openDonationBottomSheet,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'DONASI SEKARANG',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              )
            : SafeArea(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _openDonationBottomSheet,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      'DONASI SEKARANG',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String title,
    required String subtitle,
    bool singleLine = false,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: const Color(0xFF5B457D)),
        const SizedBox(height: 4),
        if (title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF26183B),
            ),
          ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 10.5,
            color: Color(0xFF7D728E),
          ),
        ),
      ],
    );
  }

  Widget _buildOrganizerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF6B5885)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF33244D),
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: Color(0xFFA094B3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUrgentNeedItem({
    required String title,
    required IconData icon,
  }) {
    return SizedBox(
      width: 54,
      child: Column(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF10B981).withValues(alpha: 0.3),
              ),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF059669),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: Color(0xFF065F46),
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
