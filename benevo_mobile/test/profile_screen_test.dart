import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/home/screens/dashboard_screen.dart';
import 'package:benevo_mobile/features/profile/screens/edit_profile_screen.dart';
import 'package:benevo_mobile/features/home/widgets/benevo_bottom_nav_bar.dart';

void main() {
  testWidgets('Renders Informasi Akun in Anonymous state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardScreen(isAnonymous: true),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Profile Nav Tab (index 4)
    final profileTabIcon = find.byType(BenevoProfileIcon);
    expect(profileTabIcon, findsOneWidget);
    await tester.tap(profileTabIcon);
    await tester.pumpAndSettle();

    // Verify Informasi Akun Anonymous elements
    expect(find.text('Informasi Akun'), findsOneWidget);
    expect(find.text('Anonymous #03'), findsOneWidget);
    expect(find.text('Edit Profil'), findsNothing); // Should not appear for anonymous
    expect(find.text('Log Out'), findsOneWidget);

    // Tap Log Out -> verify dialog appears
    await tester.tap(find.text('Log Out'));
    await tester.pumpAndSettle();

    expect(find.text('Yakin Anda mau Keluar dari\nAplikasi?'), findsOneWidget);
    expect(find.text('Batal'), findsOneWidget);
    expect(find.text('Keluar'), findsOneWidget);

    // Tap Batal -> dialog dismisses
    await tester.tap(find.text('Batal'));
    await tester.pumpAndSettle();
    expect(find.text('Yakin Anda mau Keluar dari\nAplikasi?'), findsNothing);
  });

  testWidgets('Renders Informasi Akun in Logged-In state and opens Ubah Profil', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardScreen(userName: 'Hanzel Canary', isAnonymous: false),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Profile Nav Tab (index 4)
    final profileTabIcon = find.byType(BenevoProfileIcon);
    await tester.tap(profileTabIcon);
    await tester.pumpAndSettle();

    // Verify Informasi Akun Logged-In elements
    expect(find.text('Informasi Akun'), findsOneWidget);
    expect(find.text('Hanzel Canary'), findsOneWidget);
    expect(find.text('@hn.zell_'), findsOneWidget);
    expect(find.text('Edit Profil'), findsOneWidget);
    expect(find.text('Log Out'), findsOneWidget);

    // Tap Edit Profil -> navigates to Ubah Profil
    await tester.tap(find.text('Edit Profil'));
    await tester.pumpAndSettle();

    expect(find.byType(EditProfileScreen), findsOneWidget);
    expect(find.text('Ubah Profil'), findsOneWidget);
    expect(find.text('Ganti Username'), findsOneWidget);
    expect(find.text('Data Diri'), findsOneWidget);
    expect(find.text('Nama Lengkap Sesuai KTP'), findsOneWidget);
    expect(find.text('Simpan'), findsOneWidget);

    // Tap back button
    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pumpAndSettle();

    // Back to Informasi Akun
    expect(find.text('Informasi Akun'), findsOneWidget);
  });
}
