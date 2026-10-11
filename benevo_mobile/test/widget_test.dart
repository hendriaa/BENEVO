import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/main.dart';

void main() {
  testWidgets('App starts on Register screen and seamlessly navigates to Login and back', (WidgetTester tester) async {
    await tester.pumpWidget(const BenevoApp());

    // 1. App starts on Register screen
    expect(find.text('Mulai Salurkan Kebaikan'), findsOneWidget);
    expect(find.text('Daftar'), findsOneWidget);

    // 2. Tap "Masuk Sekarang" to navigate to Login screen
    final loginFinder = find.byKey(const ValueKey('login_link'));
    expect(loginFinder, findsOneWidget);
    await tester.ensureVisible(loginFinder);
    await tester.pumpAndSettle();
    await tester.tap(loginFinder);
    await tester.pumpAndSettle();

    // 3. Verify Login screen is displayed
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.text('Lanjutkan sebagai anonim'), findsOneWidget);
    expect(find.textContaining('Google'), findsOneWidget);
    expect(find.textContaining('Apple ID'), findsOneWidget);

    // 4. Tap "Daftar Sekarang" on Login screen to navigate back to Register screen
    final registerFinder = find.byKey(const ValueKey('register_link'));
    expect(registerFinder, findsOneWidget);
    await tester.ensureVisible(registerFinder);
    await tester.pumpAndSettle();
    await tester.tap(registerFinder);
    await tester.pumpAndSettle();

    // 5. Verify back on Register screen
    expect(find.text('Mulai Salurkan Kebaikan'), findsOneWidget);
  });
}
