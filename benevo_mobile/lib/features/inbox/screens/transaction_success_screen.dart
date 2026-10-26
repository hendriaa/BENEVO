import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/constants/colors.dart';

class TransactionSuccessScreen extends StatelessWidget {
  final String transactionId;
  final String campaignTitle;
  final String campaignCategory;
  final String campaignImage;
  final String totalCollected;
  final String transactionTime;
  final String paymentMethod;
  final String donorName;
  final String donationAmount;

  const TransactionSuccessScreen({
    super.key,
    this.transactionId = '#INV-20260927-334458',
    this.campaignTitle = 'Bantuan Bencana NTT : Sandang, Pangan, Papan',
    this.campaignCategory = 'Bencana Alam',
    this.campaignImage = 'assets/images/campaigns/s2_ntt.png',
    this.totalCollected = 'Rp467.325.098',
    this.transactionTime = '27/09/2026, 14:32 WIB',
    this.paymentMethod = 'QRIS',
    this.donorName = 'Hanzel Canary',
    this.donationAmount = 'Rp50.000',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F8FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFF58329E),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Transaksi Benevo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.lock_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Success circular badge
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFFF6CE42),
                  width: 3.5,
                ),
                color: const Color(0xFF58329E),
              ),
              child: const Center(
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title
            const Text(
              'Donasi berhasil disalurkan!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF26183F),
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(height: 8),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Donasi yang Anda Lakukan telah tercatat dan sudah masuk ke rekening penerima donasi nya',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.45,
                  color: Color(0xFF757185),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // KAMPANYE PENERIMA section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'KAMPANYE PENERIMA',
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w800,
                  color: Colors.black.withValues(alpha: 0.55),
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Campaign Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFEBE6F3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 64,
                      height: 64,
                      color: const Color(0xFFEDE7F6),
                      child: Image.asset(
                        campaignImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(
                          Icons.volunteer_activism_rounded,
                          color: AppColors.primary,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDE7F6),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            campaignCategory,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF58329E),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          campaignTitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF26183F),
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Terkumpul $totalCollected',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF757185),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // RINCIAN TRANSAKSI Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFEBE6F3)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Header
                  Row(
                    children: [
                      const Icon(
                        Icons.receipt_long_rounded,
                        color: Color(0xFF58329E),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Rincian Transaksi',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF26183F),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF58329E),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Lunas',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFF0EBF5),
                    ),
                  ),

                  // Detail rows
                  _buildDetailRow(
                    label: 'ID Transaksi',
                    valueWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          transactionId,
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF26183F),
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: transactionId));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('ID Transaksi berhasil disalin'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.copy_rounded,
                            size: 14,
                            color: Color(0xFF58329E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildDetailRow(
                    label: 'Waktu Transaksi',
                    value: transactionTime,
                  ),
                  const SizedBox(height: 10),
                  _buildDetailRow(
                    label: 'Metode Pembayaran',
                    value: paymentMethod,
                  ),
                  const SizedBox(height: 10),
                  _buildDetailRow(
                    label: 'Nama Donatur',
                    value: donorName,
                  ),
                  const SizedBox(height: 10),
                  _buildDetailRow(
                    label: 'Jumlah Donasi',
                    value: donationAmount,
                    valueColor: const Color(0xFF58329E),
                    isBold: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Button: Unduh E-receipt
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('E-receipt berhasil diunduh ke perangkat'),
                      backgroundColor: Color(0xFF58329E),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.download_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                label: const Text(
                  'Unduh E-receipt',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF58329E),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Button: Kembali ke Beranda
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(
                  Icons.home_outlined,
                  color: Color(0xFF58329E),
                  size: 20,
                ),
                label: const Text(
                  'Kembali ke Beranda',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF58329E),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEDE7F6),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    String? value,
    Widget? valueWidget,
    Color valueColor = const Color(0xFF26183F),
    bool isBold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF757185),
            fontWeight: FontWeight.w500,
          ),
        ),
        if (valueWidget != null)
          valueWidget
        else
          Text(
            value ?? '',
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
              color: valueColor,
            ),
          ),
      ],
    );
  }
}
