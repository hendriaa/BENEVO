import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/fundraiser/screens/other_category_select_screen.dart';
import 'package:benevo_mobile/features/fundraiser/screens/other_fundraiser_form_screen.dart';
import 'package:benevo_mobile/features/fundraiser/screens/fundraiser_success_screen.dart';

void main() {
  testWidgets('Other Fundraiser Form Flow: Step 1 -> Step 2 -> Step 3 -> Step 4 -> Success',
      (WidgetTester tester) async {
    const testCategory = FundraiserCategory(
      name: 'Bencana Alam',
      icon: Icons.flood_rounded,
      iconColor: Color(0xFFD84315),
      bgColor: Color(0xFFFBE9E7),
      description: 'Galang dana untuk membantu korban bencana alam.',
      requirements: ['KTP'],
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: OtherFundraiserFormScreen(category: testCategory),
      ),
    );
    await tester.pumpAndSettle();

    // Verify Step 1: Tujuan
    expect(find.text('Bencana Alam'), findsOneWidget);
    expect(find.text('Tujuan Penggalangan Dana*'), findsOneWidget);
    expect(find.text('Judul Kampanye*'), findsOneWidget);
    expect(find.text('Halaman Berikutnya'), findsOneWidget);

    // Tap "Halaman Berikutnya" to go to Step 2
    await tester.tap(find.text('Halaman Berikutnya'));
    await tester.pumpAndSettle();

    // Verify Step 2: Rencana
    expect(find.text('Rencana Penggalangan Dana*'), findsOneWidget);
    expect(find.text('Metode Pencairan Dana*'), findsOneWidget);

    // Tap "Halaman Berikutnya" to go to Step 3
    await tester.tap(find.text('Halaman Berikutnya'));
    await tester.pumpAndSettle();

    // Verify Step 3: Dokumen
    expect(find.text('Dokumentasi gambar Bukti*'), findsOneWidget);

    // Tap "Halaman Berikutnya" to go to Step 4
    await tester.tap(find.text('Halaman Berikutnya'));
    await tester.pumpAndSettle();

    // Verify Step 4: Review
    expect(find.text('Semua Data Wajib Terisi dengan Lengkap!'), findsOneWidget);
    expect(find.text('Setuju dan Lanjutkan'), findsOneWidget);

    // Tap "Setuju dan Lanjutkan"
    await tester.tap(find.text('Setuju dan Lanjutkan'));
    await tester.pumpAndSettle();

    // Verify Success Screen
    expect(find.byType(FundraiserSuccessScreen), findsOneWidget);
    expect(find.textContaining('Pengajuan Berhasil'), findsOneWidget);
  });
}
