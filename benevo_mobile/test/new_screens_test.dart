import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/donation/screens/donation_catalog_screen.dart';
import 'package:benevo_mobile/features/home/screens/category_campaigns_screen.dart';
import 'package:benevo_mobile/features/home/screens/sort_screen.dart';
import 'package:benevo_mobile/features/home/screens/filter_screen.dart';
import 'package:benevo_mobile/features/home/screens/search_screen.dart';

void main() {
  testWidgets('Test Screen 1 (Donation Tab): DonationCatalogScreen renders all sections', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: DonationCatalogScreen()),
    );
    await tester.pump();

    expect(find.text('Berdonasi untuk membantu sesama'), findsOneWidget);
    expect(find.text('Pilihan Benevo'), findsOneWidget);
    expect(find.text('Penggalangan Dana Lainnya'), findsOneWidget);
    expect(find.text('Urutkan'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);
  });

  testWidgets('Test Screen 2: CategoryCampaignsScreen renders category items', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CategoryCampaignsScreen(categoryTitle: 'Bencana Alam')),
    );
    await tester.pump();

    expect(find.text('Bencana Alam'), findsOneWidget);
    expect(find.text('Kategori'), findsOneWidget);
    expect(find.text('Urutkan'), findsOneWidget);
    expect(find.text('Filter'), findsOneWidget);
    expect(find.text('DARURAT!!! WARGA NTT BUTUH PERTOLONGAN'), findsOneWidget);
  });

  testWidgets('Test Screen 3: SortScreen renders options', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SortScreen()),
    );
    await tester.pump();

    expect(find.text('Urutkan'), findsOneWidget);
    expect(find.text('Paling Mendesak'), findsOneWidget);
    expect(find.text('Paling Sesuai'), findsOneWidget);
    expect(find.text('Terbaru'), findsOneWidget);
  });

  testWidgets('Test Screen 4: FilterScreen renders checkboxes', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: FilterScreen()),
    );
    await tester.pump();

    expect(find.text('Filter'), findsOneWidget);
    expect(find.text('Oleh Benevo'), findsOneWidget);
    expect(find.text('Digalang Oleh Yayasan'), findsOneWidget);
    expect(find.text('Digalang Oleh Publik'), findsOneWidget);
  });

  testWidgets('Test Screen 5: SearchScreen renders history and recommendations', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SearchScreen()),
    );
    await tester.pump();

    expect(find.text('Riwayat Pencarian'), findsOneWidget);
    expect(find.text('Pencarian Terakhir'), findsOneWidget);
    expect(find.text('Pengobatan Balita'), findsOneWidget);
    expect(find.text('Pencarian Pilihan'), findsOneWidget);
    expect(find.text('Kata Kunci'), findsOneWidget);
    expect(find.text('Balita'), findsOneWidget);
  });
}
