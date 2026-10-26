import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/inbox/screens/inbox_screen.dart';
import 'package:benevo_mobile/features/inbox/screens/transaction_success_screen.dart';
import 'package:benevo_mobile/features/inbox/screens/transaction_failed_screen.dart';

void main() {
  testWidgets('InboxScreen renders tabs and history items', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: InboxScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Inbox'), findsOneWidget);
    expect(find.text('Riwayat'), findsOneWidget);
    expect(find.text('Kabar'), findsOneWidget);
    expect(find.text('Status'), findsOneWidget);

    // Verify first history item from screen 1
    expect(find.text('Bantuan Bencana NTT : Sandang, Pangan, Papan'), findsOneWidget);
    expect(find.text('Rp 50.000'), findsOneWidget);
  });

  testWidgets('InboxScreen can switch to Kabar and Status tabs', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(
      const MaterialApp(
        home: InboxScreen(),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Kabar tab
    await tester.tap(find.text('Kabar'));
    await tester.pumpAndSettle();
    expect(find.text('Pencairan Dana'), findsWidgets);
    expect(find.text('Lihat Selengkapnya'), findsWidgets);

    // Tap Status tab
    await tester.tap(find.text('Status'));
    await tester.pumpAndSettle();
    expect(find.text('Donasi Berhasil disalurkan!'), findsWidgets);
    expect(find.text('Menunggu Pembayaran'), findsOneWidget);
    expect(find.text('Transaksi Donasi Gagal'), findsOneWidget);
  });

  testWidgets('TransactionSuccessScreen renders all details properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TransactionSuccessScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Transaksi Benevo'), findsOneWidget);
    expect(find.text('Donasi berhasil disalurkan!'), findsOneWidget);
    expect(find.text('KAMPANYE PENERIMA'), findsOneWidget);
    expect(find.text('Rincian Transaksi'), findsOneWidget);
    expect(find.text('Lunas'), findsOneWidget);
    expect(find.text('#INV-20260927-334458'), findsOneWidget);
    expect(find.text('Unduh E-receipt'), findsOneWidget);
    expect(find.text('Kembali ke Beranda'), findsOneWidget);
  });

  testWidgets('TransactionFailedScreen renders all details properly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TransactionFailedScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Transaksi Benevo'), findsOneWidget);
    expect(find.text('Pembayaran Belum berhasil'), findsOneWidget);
    expect(find.text('Diagnostik Pembayaran'), findsOneWidget);
    expect(find.text('Auto-Detect'), findsOneWidget);
    expect(find.text('Transaksi Dibatalkan Oleh Sistem Bank'), findsOneWidget);
    expect(find.text('Gagal'), findsOneWidget);
    expect(find.text('Kembali ke Beranda'), findsOneWidget);
  });
}
