import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/main.dart';

void main() {
  testWidgets('Login screen loads properly and navigates to Register', (WidgetTester tester) async {
    await tester.pumpWidget(const BenevoApp());
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.text('Lanjutkan sebagai anonim'), findsOneWidget);
    expect(find.textContaining('Google'), findsOneWidget);
    expect(find.textContaining('Apple ID'), findsOneWidget);

    // Tap "Daftar Sekarang"
    final registerFinder = find.byKey(const ValueKey('register_link'));
    expect(registerFinder, findsOneWidget);
    await tester.ensureVisible(registerFinder);
    await tester.pumpAndSettle();
    await tester.tap(registerFinder);
    await tester.pumpAndSettle();

    // Verify Register screen is displayed
    expect(find.text('Mulai Salurkan Kebaikan'), findsOneWidget);
    expect(find.text('Daftar'), findsOneWidget);

    // Tap "Masuk Sekarang" to navigate back
    final loginFinder = find.byKey(const ValueKey('login_link'));
    expect(loginFinder, findsOneWidget);
    await tester.ensureVisible(loginFinder);
    await tester.pumpAndSettle();
    await tester.tap(loginFinder);
    await tester.pumpAndSettle();

    // Verify back to Login screen
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
  });
}
