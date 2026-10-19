import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../home/screens/dashboard_screen.dart';

class DonationSuccessScreen extends StatelessWidget {
  final String campaignTitle;
  final int amount;
  final String paymentMethod;
  final bool isAnonymous;
  final String transactionId;

  const DonationSuccessScreen({
    super.key,
    required this.campaignTitle,
    required this.amount,
    required this.paymentMethod,
    this.isAnonymous = false,
    required this.transactionId,
  });

  String _formatCurrency(int val) {
    return 'Rp${val.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Bukti Donasi',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Success Icon
              Container(
                width: 76,
                height: 76,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8FDF2),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle_rounded,
                    color: Color(0xFF10B981),
                    size: 48,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Alhamdulillah, Donasi Berhasil!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Terima kasih telah menyalurkan kepedulian dan kebaikan untuk saudara kita.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 26),

              // Receipt Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAF8FD),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: const Color(0xFFECE4F6)),
                ),
                child: Column(
                  children: [
                    _buildRow('No. Transaksi', transactionId),
                    const Divider(height: 20, color: Color(0xFFEADBFC)),
                    _buildRow('Program', campaignTitle, maxLines: 2),
                    const Divider(height: 20, color: Color(0xFFEADBFC)),
                    _buildRow('Metode Pembayaran', paymentMethod),
                    const Divider(height: 20, color: Color(0xFFEADBFC)),
                    _buildRow(
                      'Nama Donatur',
                      isAnonymous ? 'Donatur Anonim (Hamba Allah)' : 'Hanzel',
                    ),
                    const Divider(height: 20, color: Color(0xFFEADBFC)),
                    _buildRow(
                      'Total Donasi',
                      _formatCurrency(amount),
                      isTotal: true,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Return to Dashboard Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isTotal = false, int maxLines = 1}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12.5,
              color: Color(0xFF7A6F8B),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.right,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isTotal ? 15 : 12.5,
              fontWeight: isTotal ? FontWeight.w800 : FontWeight.w600,
              color: isTotal ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
