import 'package:flutter/material.dart';
import '../screens/transaction_success_screen.dart';
import '../screens/transaction_failed_screen.dart';
import '../../donation/screens/payment_screen.dart';

enum DonationStatusType {
  success,
  pending,
  failed,
}

class DonationStatusItem {
  final String statusText;
  final DonationStatusType type;
  final String totalDonation;
  final String method;
  final String recipient;
  final String actionLabel;
  final String transactionId;
  final String campaignCategory;
  final String campaignImage;

  const DonationStatusItem({
    required this.statusText,
    required this.type,
    required this.totalDonation,
    required this.method,
    required this.recipient,
    required this.actionLabel,
    required this.transactionId,
    required this.campaignCategory,
    required this.campaignImage,
  });
}

class StatusTabView extends StatelessWidget {
  const StatusTabView({super.key});

  static const List<DonationStatusItem> items = [
    DonationStatusItem(
      statusText: 'Donasi Berhasil disalurkan!',
      type: DonationStatusType.success,
      totalDonation: 'Rp50.000',
      method: 'QRIS',
      recipient: 'Bantuan Bencana NTT : Sandang, Pangan, Papan',
      actionLabel: 'Rincian Transaksi',
      transactionId: '#INV-20260927-334458',
      campaignCategory: 'Bencana Alam',
      campaignImage: 'assets/images/campaigns/s2_ntt.png',
    ),
    DonationStatusItem(
      statusText: 'Donasi Berhasil disalurkan!',
      type: DonationStatusType.success,
      totalDonation: 'Rp100.000',
      method: 'Mandiri Transfer',
      recipient: 'Patungan Untuk Hutan',
      actionLabel: 'Rincian Transaksi',
      transactionId: '#INV-20260921-112233',
      campaignCategory: 'Lingkungan',
      campaignImage: 'assets/images/campaigns/s2_karhutla.png',
    ),
    DonationStatusItem(
      statusText: 'Menunggu Pembayaran',
      type: DonationStatusType.pending,
      totalDonation: 'Rp100.000',
      method: 'Mandiri Transfer',
      recipient: 'Patungan Untuk Hutan',
      actionLabel: 'Halaman Pembayaran',
      transactionId: '#INV-20260921-998877-PENDING',
      campaignCategory: 'Lingkungan',
      campaignImage: 'assets/images/campaigns/s2_karhutla.png',
    ),
    DonationStatusItem(
      statusText: 'Transaksi Donasi Gagal',
      type: DonationStatusType.failed,
      totalDonation: 'Rp100.000',
      method: 'BCA Virtual Account',
      recipient: 'Patungan Untuk Hutan',
      actionLabel: 'Ulang Transaksi',
      transactionId: '#INV-20260921-224458-EXPIRED',
      campaignCategory: 'Lingkungan',
      campaignImage: 'assets/images/campaigns/s2_karhutla.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        final Color statusColor;

        switch (item.type) {
          case DonationStatusType.success:
            statusColor = const Color(0xFF16A34A);
            break;
          case DonationStatusType.pending:
            statusColor = const Color(0xFFD97706);
            break;
          case DonationStatusType.failed:
            statusColor = const Color(0xFFDC2626);
            break;
        }

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEBE6F3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with status dot and status title
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: statusColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.statusText,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Detail lines
              _buildInfoRow('Total Donasi', item.totalDonation, isBold: true),
              const SizedBox(height: 6),
              _buildInfoRow('Metode', item.method),
              const SizedBox(height: 6),
              _buildInfoRow('Penerima', item.recipient),
              const SizedBox(height: 14),

              // Action button row
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () => _handleAction(context, item),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF58329E),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      item.actionLabel,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 85,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF757185),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Text(
          ': ',
          style: TextStyle(
            fontSize: 11.5,
            color: Color(0xFF757185),
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
              color: const Color(0xFF26183F),
            ),
          ),
        ),
      ],
    );
  }

  void _handleAction(BuildContext context, DonationStatusItem item) {
    if (item.type == DonationStatusType.success) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TransactionSuccessScreen(
            transactionId: item.transactionId,
            campaignTitle: item.recipient,
            campaignCategory: item.campaignCategory,
            campaignImage: item.campaignImage,
            totalCollected: 'Rp467.325.098',
            transactionTime: '27/09/2026, 14:32 WIB',
            paymentMethod: item.method,
            donorName: 'Hanzel Canary',
            donationAmount: item.totalDonation,
          ),
        ),
      );
    } else if (item.type == DonationStatusType.failed) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TransactionFailedScreen(
            transactionId: item.transactionId,
            campaignTitle: item.recipient,
            campaignCategory: item.campaignCategory,
            campaignImage: item.campaignImage,
            totalCollected: 'Rp127.321.984',
            transactionTime: '21/09/2026, 10:15 WIB',
            paymentMethod: item.method,
            donorName: 'Hanzel Canary',
            donationAmount: item.totalDonation,
            failureReason: 'Transaksi Dibatalkan Oleh Sistem Bank',
          ),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PaymentScreen(
            campaignTitle: 'Patungan Untuk Hutan',
            initialAmount: 100000,
          ),
        ),
      );
    }
  }
}
