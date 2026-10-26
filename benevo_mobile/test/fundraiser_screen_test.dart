import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/fundraiser/screens/fundraiser_screen.dart';
import 'package:benevo_mobile/features/fundraiser/screens/fundraiser_category_screen.dart';
import 'package:benevo_mobile/features/fundraiser/screens/medical_fundraiser_form_screen.dart';
import 'package:benevo_mobile/features/fundraiser/screens/fundraiser_success_screen.dart';

void main() {
  testWidgets('FundraiserScreen renders hero, steps, tips, and cta', (WidgetTester tester) async {
    bool backTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: FundraiserScreen(
          onBackToHome: () {
            backTapped = true;
          },
        ),
      ),
    );

    // Verify Brand Logo in RichText (exactly "Benevo")
    expect(
      find.byWidgetPredicate(
        (widget) => widget is RichText && widget.text.toPlainText().trim() == 'Benevo',
      ),
      findsOneWidget,
    );

    // Verify Hero texts
    expect(find.text('Galang Dana untuk semua\nyang membutuhkan!'), findsOneWidget);
    expect(find.text('Galang dana sekarang!'), findsOneWidget);

    // Verify Cara Galang dana section
    expect(find.text('Cara Galang dana di Benevo'), findsOneWidget);
    expect(find.text('Pilih jenis galang dana'), findsOneWidget);
    expect(find.text('Isi form pembuatan dana'), findsOneWidget);
    expect(find.text('Verifikasi Galang dana kamu'), findsOneWidget);

    // Verify Tips section
    expect(find.text('Tips Galang dana'), findsOneWidget);
    expect(find.text('Verifikasi Identitas & dokumen'), findsOneWidget);
    expect(find.text('Sebarkan galang dana kamu sesering mungkin'), findsOneWidget);

    // Verify CTA Section
    expect(find.text('Sudah tahu tata caranya, kan?'), findsOneWidget);
    expect(find.text('Galang Dana Sekarang'), findsOneWidget);

    // Tap back button
    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pump();
    expect(backTapped, isTrue);
  });

  testWidgets('FundraiserCategoryScreen opens requirements dialog and navigates to form', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: FundraiserCategoryScreen(),
      ),
    );

    // Verify category header and items
    expect(find.text('Pengajuan Menggalang Dana'), findsOneWidget);
    expect(find.text('Hai Orang Baik!'), findsOneWidget);
    expect(find.text('Galang dana bantuan untuk orang sakit dan keperluan medis'), findsOneWidget);
    expect(find.text('Galang Dana untuk jenis bantuan lainnya'), findsOneWidget);

    // Tap "Buat galang dana" on first card
    await tester.tap(find.text('Buat galang dana').first);
    await tester.pumpAndSettle();

    // Verify dialog content
    expect(find.text('Pastikan kamu orang yang berhak membuat galang dana dengan memiliki rincian persyaratan dokumen berikut :'), findsOneWidget);
    expect(find.text('Mengerti'), findsOneWidget);

    // Tap "Mengerti"
    await tester.tap(find.text('Mengerti'));
    await tester.pumpAndSettle();

    // Verify navigated to MedicalFundraiserFormScreen
    expect(find.byType(MedicalFundraiserFormScreen), findsOneWidget);
    expect(find.text('Tujuan Penggalangan Dana*'), findsOneWidget);
  });

  testWidgets('MedicalFundraiserFormScreen steps through 1 to 5 and submits to success', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MedicalFundraiserFormScreen(),
      ),
    );

    // Step 1: Tujuan
    expect(find.text('Tujuan Penggalangan Dana*'), findsOneWidget);
    await tester.tap(find.text('Halaman Berikutnya'));
    await tester.pumpAndSettle();

    // Step 2: Pasien
    expect(find.text('Data Pasien*'), findsOneWidget);
    await tester.tap(find.text('Halaman Berikutnya'));
    await tester.pumpAndSettle();

    // Step 3: Rencana
    expect(find.text('Rencana Biaya Pengobatan*'), findsOneWidget);
    await tester.tap(find.text('Halaman Berikutnya'));
    await tester.pumpAndSettle();

    // Step 4: Dokumen
    expect(find.text('Dokumen wajib'), findsOneWidget);
    await tester.tap(find.text('Halaman Berikutnya'));
    await tester.pumpAndSettle();

    // Step 5: Review
    expect(find.text('Semua Data Wajib terisi dengan lengkap!'), findsOneWidget);
    expect(find.text('Setuju dan Lanjutkan'), findsOneWidget);

    // Tap submit button
    await tester.tap(find.text('Setuju dan Lanjutkan'));
    await tester.pumpAndSettle();

    // Success Screen
    expect(find.byType(FundraiserSuccessScreen), findsOneWidget);
    expect(find.text('Pengajuan Berhasil\nterkirim'), findsOneWidget);
    expect(find.text('Lihat status Pengajuan'), findsOneWidget);
    expect(find.text('Kembali ke beranda'), findsOneWidget);
  });
}
