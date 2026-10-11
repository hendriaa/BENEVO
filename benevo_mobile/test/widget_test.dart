import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/main.dart';

void main() {
  testWidgets('Complete Journey: Register -> Login -> Dashboard & Password Reset', (WidgetTester tester) async {
    await tester.pumpWidget(const BenevoApp());

    // 1. App starts on Register screen
    expect(find.text('Mulai Salurkan Kebaikan'), findsOneWidget);

    // 2. Navigate to Login screen
    final loginLink = find.byKey(const ValueKey('login_link'));
    expect(loginLink, findsOneWidget);
    await tester.ensureVisible(loginLink);
    await tester.pumpAndSettle();
    await tester.tap(loginLink);
    await tester.pumpAndSettle();

    // 3. Verify Login screen
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);

    // 4. Test Login -> Dashboard
    final loginFields = find.byType(TextFormField);
    await tester.enterText(loginFields.at(0), 'hanzel@benevo.id');
    await tester.enterText(loginFields.at(1), 'password123');
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Masuk'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1200));
    await tester.pumpAndSettle();

    // 5. Verify Dashboard Screen elements
    expect(find.text('Halo, Hanzel'), findsOneWidget);
    expect(find.text('cari yang ingin kamu bantu'), findsOneWidget);
    expect(find.text('RP 5.600.000'), findsOneWidget);
    expect(find.text('14 campaign'), findsOneWidget);
    expect(find.text('100%'), findsOneWidget);
    expect(find.text('Semua'), findsOneWidget);
    expect(find.text('Darurat & Bencana'), findsOneWidget);
    expect(find.text('Kesehatan'), findsOneWidget);
    expect(find.text('Bantuan Bencana Gempa NTT: Sandang, Pangan, Papan'), findsOneWidget);
    expect(find.text('Berdonasi'), findsOneWidget);
    expect(find.text('Kategori Yang dapat kamu pilih'), findsOneWidget);
    expect(find.text('Bencana Alam'), findsOneWidget);
    expect(find.text('Balita & Anak Sakit'), findsOneWidget);
    expect(find.text('Bantuan & Medis'), findsOneWidget);
    expect(find.text('Bantuan Pendidikan'), findsOneWidget);
    expect(find.text('Bantuan Sekolah terpelosok di Maluku Utara'), findsOneWidget);
    expect(find.text('Bantuan Infrastruktur Sekolah Prihatinkan di Papua Barat'), findsOneWidget);

    // 6. Test Filter Tab interaction
    await tester.tap(find.text('Darurat & Bencana'));
    await tester.pumpAndSettle();
  });
}
