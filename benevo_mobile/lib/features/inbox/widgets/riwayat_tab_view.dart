import 'package:flutter/material.dart';
import '../screens/transaction_success_screen.dart';

class DonationHistoryItem {
  final String title;
  final String date;
  final String paymentMethod;
  final String amount;
  final String category;
  final String imagePath;
  final String transactionId;

  const DonationHistoryItem({
    required this.title,
    required this.date,
    required this.paymentMethod,
    required this.amount,
    this.category = 'Bencana Alam',
    this.imagePath = 'assets/images/campaigns/s2_ntt.png',
    this.transactionId = '#INV-20260927-334458',
  });
}

class RiwayatTabView extends StatelessWidget {
  const RiwayatTabView({super.key});

  static const List<DonationHistoryItem> items = [
    DonationHistoryItem(
      title: 'Bantuan Bencana NTT : Sandang, Pangan, Papan',
      date: 'Minggu, 27 September 2026',
      paymentMethod: 'QRIS',
      amount: 'Rp 50.000',
      category: 'Bencana Alam',
      imagePath: 'assets/images/campaigns/s2_ntt.png',
      transactionId: '#INV-20260927-334458',
    ),
    DonationHistoryItem(
      title: 'Patungan Untuk Hutan',
      date: 'Kamis, 21 September 2026',
      paymentMethod: 'Mandiri Transfer',
      amount: 'Rp 100.000',
      category: 'Lingkungan',
      imagePath: 'assets/images/campaigns/s2_karhutla.png',
      transactionId: '#INV-20260921-112233',
    ),
    DonationHistoryItem(
      title: 'Celengan Siaga Bencana Indonesia',
      date: 'Rabu, 20 September 2026',
      paymentMethod: 'BCA Transfer',
      amount: 'Rp 150.000',
      category: 'Bencana Alam',
      imagePath: 'assets/images/campaigns/s2_banjir.png',
      transactionId: '#INV-20260920-554433',
    ),
    DonationHistoryItem(
      title: 'Dukung Petani Perempuan Indonesia',
      date: 'Rabu, 20 September 2026',
      paymentMethod: 'Gopay',
      amount: 'Rp 67.000',
      category: 'Sosial & Budaya',
      imagePath: 'assets/images/campaigns/s5_petani.png',
      transactionId: '#INV-20260920-887766',
    ),
    DonationHistoryItem(
      title: 'Bantuan Medis Korban Gempa NTT',
      date: 'Sabtu, 19 September 2026',
      paymentMethod: 'BRI Virtual Account',
      amount: 'Rp 500.000',
      category: 'Medis & Kesehatan',
      imagePath: 'assets/images/campaigns/s2_anak_ntt.png',
      transactionId: '#INV-20260919-990011',
    ),
    DonationHistoryItem(
      title: 'Bangun Jalan Aspal Kampung Durian Runtuh',
      date: 'Senin, 14 September 2026',
      paymentMethod: 'DANA',
      amount: 'Rp 25.000',
      category: 'Infrastruktur',
      imagePath: 'assets/images/campaigns/c1_jalan.png',
      transactionId: '#INV-20260914-443322',
    ),
    DonationHistoryItem(
      title: 'Genggaman Tangan, untuk Operasi Pejuang Kanker',
      date: 'Selasa, 15 September 2026',
      paymentMethod: 'BCA Virtual Account',
      amount: 'Rp 170.000',
      category: 'Medis & Kesehatan',
      imagePath: 'assets/images/campaigns/c1_kanker.png',
      transactionId: '#INV-20260915-776655',
    ),
    DonationHistoryItem(
      title: 'Tanam 250.00 Pohon mu di Sumatra',
      date: 'Jumat, 18 September 2026',
      paymentMethod: 'BCA Virtual Account',
      amount: 'Rp 90.000',
      category: 'Lingkungan',
      imagePath: 'assets/images/campaigns/c2_pohon.png',
      transactionId: '#INV-20260918-123456',
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
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TransactionSuccessScreen(
                  transactionId: item.transactionId,
                  campaignTitle: item.title,
                  campaignCategory: item.category,
                  campaignImage: item.imagePath,
                  totalCollected: 'Rp467.325.098',
                  transactionTime: '${item.date}, 14:32 WIB',
                  paymentMethod: item.paymentMethod,
                  donorName: 'Hanzel Canary',
                  donationAmount: item.amount,
                ),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF26183F),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.date} • ${item.paymentMethod}',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF757185),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFF3EFF8),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Nominal Donasi',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF757185),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      item.amount,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF26183F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
