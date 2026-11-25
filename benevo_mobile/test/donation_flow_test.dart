import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/donation/screens/campaign_detail_screen.dart';
import 'package:benevo_mobile/features/donation/screens/payment_screen.dart';
import 'package:benevo_mobile/features/donation/screens/donation_success_screen.dart';
import 'package:benevo_mobile/features/donation/widgets/nominal_selection_bottom_sheet.dart';
import 'package:benevo_mobile/features/donation/widgets/payment_method_widgets.dart';
import 'package:benevo_mobile/features/home/screens/dashboard_screen.dart';

void main() {
  testWidgets('Donation Journey: Campaign Detail -> Select Nominal -> Payment (QRIS & E-Wallet Only) -> Success', (WidgetTester tester) async {
    // 1. Start from DashboardScreen
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // 2. Find and tap "Berdonasi" on featured campaign
    final berdonasiButton = find.widgetWithText(ElevatedButton, 'Berdonasi');
    expect(berdonasiButton, findsOneWidget);
    await tester.ensureVisible(berdonasiButton);
    await tester.tap(berdonasiButton);
    await tester.pumpAndSettle();

    // 3. Verify CampaignDetailScreen & NominalSelectionBottomSheet are displayed directly
    expect(find.byType(CampaignDetailScreen), findsOneWidget);
    expect(find.byType(NominalSelectionBottomSheet), findsOneWidget);
    expect(find.text('Rp50.000'), findsOneWidget);
    expect(find.text('Rp100.000'), findsOneWidget);
    expect(find.text('Rp150.000'), findsOneWidget);
    expect(find.text('Rp200.000'), findsOneWidget);
    expect(find.text('Min. Donasi sebesar Rp1.000'), findsOneWidget);

    // Tap Rp100.000 preset
    await tester.tap(find.text('Rp100.000'));
    await tester.pumpAndSettle();

    // Tap "Lanjut Pembayaran"
    final lanjutBtn = find.widgetWithText(ElevatedButton, 'Lanjut Pembayaran');
    expect(lanjutBtn, findsOneWidget);
    await tester.tap(lanjutBtn);
    await tester.pumpAndSettle();

    // 6. Verify PaymentScreen
    expect(find.byType(PaymentScreen), findsOneWidget);
    expect(find.text('Pilih Metode Pembayaran'), findsOneWidget);
    expect(find.text('100.000'), findsOneWidget);

    // Verify QRIS, E-Wallets, and Virtual Accounts exist
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'QRIS'), findsOneWidget);
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'GoPay'), findsOneWidget);
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'ShopeePay'), findsOneWidget);
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'DANA'), findsOneWidget);
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'OVO'), findsOneWidget);
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'BCA (Virtual Account)'), findsOneWidget);
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'Mandiri (Virtual Account)'), findsOneWidget);
    expect(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'BNI (Virtual Account)'), findsOneWidget);

    // Test Anonymous Donation Switch (first switch)
    final switches = find.byType(Switch);
    expect(switches, findsNWidgets(2));
    await tester.tap(switches.first);
    await tester.pumpAndSettle();

    // Test Celengan Bonus Switch (second switch: Screen 2 vs Screen 3)
    expect(find.text('Rp100.000'), findsWidgets); // Total is 100.000 before bonus
    await tester.tap(switches.last); // Turn on Celengan bonus (-Rp 25.000)
    await tester.pumpAndSettle();
    expect(find.text('Rp75.000'), findsOneWidget); // Total becomes 75.000

    await tester.tap(switches.last); // Turn off bonus for remaining flow
    await tester.pumpAndSettle();
    expect(find.text('Rp100.000'), findsWidgets);

    // 7. Select E-Wallet (GoPay)
    await tester.tap(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'GoPay'));
    await tester.pumpAndSettle();

    // 8. Select QRIS back
    await tester.tap(find.byWidgetPredicate((w) => w is PaymentMethodTile && w.item.title == 'QRIS'));
    await tester.pumpAndSettle();

    // Tap "Lanjut Pembayaran" to show QRIS Modal
    final payBtn = find.widgetWithText(ElevatedButton, 'Lanjut Pembayaran');
    await tester.tap(payBtn);
    await tester.pumpAndSettle();

    // Verify QRIS Modal and timer
    expect(find.text('NMID: ID1020038918291 • BENEVO PEDULI'), findsOneWidget);
    expect(find.text('Saya Sudah Bayar'), findsOneWidget);

    // 9. Tap "Saya Sudah Bayar"
    await tester.tap(find.text('Saya Sudah Bayar'));
    await tester.pumpAndSettle();

    // 10. Verify DonationSuccessScreen
    expect(find.byType(DonationSuccessScreen), findsOneWidget);
    expect(find.text('Alhamdulillah, Donasi Berhasil!'), findsOneWidget);
    expect(find.text('Donatur Anonim (Hamba Allah)'), findsOneWidget);
    expect(find.text('Rp100.000'), findsOneWidget);

    // 11. Tap "Kembali ke Beranda"
    await tester.tap(find.text('Kembali ke Beranda'));
    await tester.pumpAndSettle();

    // Verify back on Dashboard
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
