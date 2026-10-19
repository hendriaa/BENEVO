class CampaignModel {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final int currentAmount;
  final int targetAmount;
  final int donorsCount;
  final int updatesCount;
  final int disbursementsCount;
  final String organizerName;
  final String organizerAvatarUrl;
  final bool isOrganizerVerified;
  final String storyDate;
  final String storyContent;
  final List<UrgentNeed> urgentNeeds;

  const CampaignModel({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.currentAmount,
    required this.targetAmount,
    required this.donorsCount,
    required this.updatesCount,
    required this.disbursementsCount,
    required this.organizerName,
    required this.organizerAvatarUrl,
    this.isOrganizerVerified = true,
    required this.storyDate,
    required this.storyContent,
    required this.urgentNeeds,
  });

  double get progressPercentage =>
      targetAmount > 0 ? (currentAmount / targetAmount).clamp(0.0, 1.0) : 0.0;

  static CampaignModel nttEarthquakeCampaign = const CampaignModel(
    id: 'campaign_ntt_01',
    title: 'Bantuan Bencana Gempa NTT: Sandang, Pangan, Papan',
    category: 'DARURAT & BENCANA',
    imageUrl:
        'https://images.unsplash.com/photo-1542810634-71277d95dcbb?w=800',
    currentAmount: 566000000,
    targetAmount: 1000000000,
    donorsCount: 9670,
    updatesCount: 12,
    disbursementsCount: 5,
    organizerName: 'Aktivis Indonesia',
    organizerAvatarUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=200',
    isOrganizerVerified: true,
    storyDate: '20 Agustus 2026',
    storyContent:
        'Teman-teman, NTT sedang khawatir dan warga terdampak gempa membutuhkan bantuan kita. Gempa tektonik berkekuatan M5,7 mengguncang wilayah Timur Laut Mbay, Kabupaten Nagekeo, Nusa Tenggara Timur, pada Sabtu (15/08). Guncangan gempa juga dirasakan di sejumlah wilayah NTT, termasuk Nagekeo, Manggarai Barat, Manggarai, Manggarai Timur, Ende, Sikka, Alor, dan Lembata. BMKG juga mengeluarkan peringatan potensi tsunami di sejumlah wilayah NTT, NTB, Sulawesi Selatan, dan Sulawesi Tenggara.\n\n'
        'Kondisi sementara, berdasarkan data terbaru (19/08):\n'
        '• 78 warga meninggal dunia\n'
        '• 1.182 mengalami luka-luka\n'
        '• 48 ribu warga mengungsi\n\n'
        'Saat ini, pemantauan dan pendataan dampak gempa masih terus dilakukan, sementara warga di wilayah terdampak masih potensi menghadapi gempa susulan dan mengikuti perkembangan peringatan tsunami dari BMKG. Di tengah kondisi darurat dan keterbatasan yang ada, dukungan kita berisikan untuk membantu memenuhi kebutuhan warga yang terdampak serta mendukung proses penanganan di lapangan.',
    urgentNeeds: [
      UrgentNeed(title: 'Bantuan Makanan', iconType: 'food'),
      UrgentNeed(title: 'Pakaian Layak', iconType: 'clothes'),
      UrgentNeed(title: 'Perlengkapan Kebersihan', iconType: 'hygiene'),
      UrgentNeed(title: 'Obat-obatan', iconType: 'medicine'),
      UrgentNeed(title: 'Layanan Kesehatan', iconType: 'health'),
    ],
  );
}

class UrgentNeed {
  final String title;
  final String iconType;

  const UrgentNeed({
    required this.title,
    required this.iconType,
  });
}
