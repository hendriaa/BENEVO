import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/main.dart';
import 'package:benevo_mobile/features/home/widgets/benevo_bottom_nav_bar.dart';

void main() {
  testWidgets('Complete Journey: Register -> Login -> Home Dashboard -> Donation Tab', (WidgetTester tester) async {
    await tester.pumpWidget(const BenevoApp());

    // 0. Wait for Splash Screen loading to complete and transition to Register Screen
    await tester.pump(const Duration(milliseconds: 2600));
    await tester.pumpAndSettle();

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

    // 4. Test Login -> Dashboard (Home Tab 0)
    final loginFields = find.byType(TextFormField);
    await tester.enterText(loginFields.at(0), 'hanzel@benevo.id');
    await tester.enterText(loginFields.at(1), 'password123');
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Masuk'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1200));
    await tester.pumpAndSettle();

    // 5. Verify Original Home Dashboard Screen elements
    expect(find.text('Halo, Hanzel'), findsOneWidget);
    expect(find.text('RP 5.600.000'), findsOneWidget);
    expect(find.text('14 campaign'), findsOneWidget);
    expect(find.text('100%'), findsOneWidget);
    expect(find.text('cari yang ingin kamu bantu'), findsWidgets);

    // 6. Switch to Donation Tab (Tab 1 - Hand icon next to home)
    final donationNavIcon = find.byType(BenevoDonationIcon);
    expect(donationNavIcon, findsOneWidget);
    await tester.tap(donationNavIcon);
    await tester.pumpAndSettle();

    // 7. Verify Donation Catalog Screen elements
    expect(find.text('Berdonasi untuk membantu sesama'), findsOneWidget);
    expect(find.text('Pilihan Benevo'), findsOneWidget);
    expect(find.text('Penggalangan Dana Lainnya'), findsOneWidget);
    expect(find.text('Bencana Alam'), findsWidgets);
    expect(find.text('Balita & Anak Sakit'), findsWidgets);
  });
}
