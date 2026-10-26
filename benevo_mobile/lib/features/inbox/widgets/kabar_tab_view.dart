import 'package:flutter/material.dart';

class KabarUpdateItem {
  final String type;
  final String title;
  final String info;
  final String detailStory;

  const KabarUpdateItem({
    required this.type,
    required this.title,
    required this.info,
    required this.detailStory,
  });
}

class KabarTabView extends StatelessWidget {
  const KabarTabView({super.key});

  static const List<KabarUpdateItem> items = [
    KabarUpdateItem(
      type: 'Pencairan Dana',
      title: 'Genggaman Tangan, untuk Operasi Pejuang Kanker',
      info: '30 September 2026 • Sebesar: Rp143.000.000',
      detailStory:
          'Dana sebesar Rp143.000.000 telah berhasil dicairkan ke rekening rumah sakit rekanan untuk membiayai operasi lanjutan pasien pejuang kanker stadium 3.',
    ),
    KabarUpdateItem(
      type: 'Kabar terbaru',
      title: 'Bantuan Medis Korban Gempa NTT',
      info: '25 September 2026 • 68 Anak-Anak 70 Orang Dewasa Luka Luka',
      detailStory:
          'Tim relawan medis telah tiba di posko bencana NTT untuk memberikan penanganan pertama pada 68 anak-anak dan 70 orang dewasa korban luka-luka.',
    ),
    KabarUpdateItem(
      type: 'Kabar terbaru',
      title: 'Bantuan Medis Korban Gempa NTT',
      info: '25 September 2026 • Pengobatan Telah di salurkan dari pihak pe...',
      detailStory:
          'Pengobatan dan suplemen darurat telah disalurkan dari pihak penyalur kepada posko terpencil yang sebelumnya sempat terisolasi.',
    ),
    KabarUpdateItem(
      type: 'Pencairan Dana',
      title: 'Bangun Jalan Aspal Kampung Durian Runtuh',
      info: '27 September 2026 • Sebesar: Rp64.000.000',
      detailStory:
          'Pencairan termin pertama sebesar Rp64.000.000 telah diterima oleh pengurus desa untuk pengadaan aspal dan semen pengerasan jalan utama kampung.',
    ),
    KabarUpdateItem(
      type: 'Pencairan Dana',
      title: 'Patungan Untuk Hutan',
      info: '18 September 2026 • Sebesar: Rp13.500.000',
      detailStory:
          'Sebesar Rp13.500.000 dana tahap 2 telah disalurkan untuk pembelian 250 bibit pohon endemik dan alat pemantau kebakaran hutan.',
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
        final isPencairan = item.type == 'Pencairan Dana';

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
              // Type badge row with dot
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF22C55E),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item.type,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isPencairan
                          ? const Color(0xFF16A34A)
                          : const Color(0xFF58329E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Title
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

              // Info
              Text(
                item.info,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF757185),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),

              // Action button row
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () => _showUpdateDetailModal(context, item),
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
                    child: const Text(
                      'Lihat Selengkapnya',
                      style: TextStyle(
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

  void _showUpdateDetailModal(BuildContext context, KabarUpdateItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2DCED),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF22C55E),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item.type,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16A34A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF26183F),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.info,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF757185),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(height: 1, color: Color(0xFFEFEAF5)),
              const SizedBox(height: 16),
              Text(
                item.detailStory,
                style: const TextStyle(
                  fontSize: 13.5,
                  height: 1.5,
                  color: Color(0xFF4A4458),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF58329E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: const Text(
                    'Tutup',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
