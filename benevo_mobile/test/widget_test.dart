import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/main.dart';

void main() {
  testWidgets('Full Auth & Password Reset Journey Test', (WidgetTester tester) async {
    await tester.pumpWidget(const BenevoApp());

    // 1. App starts on Register screen
    expect(find.text('Mulai Salurkan Kebaikan'), findsOneWidget);
    expect(find.text('Daftar'), findsOneWidget);

    // 2. Navigate to Login screen
    final loginLink = find.byKey(const ValueKey('login_link'));
    expect(loginLink, findsOneWidget);
    await tester.ensureVisible(loginLink);
    await tester.pumpAndSettle();
    await tester.tap(loginLink);
    await tester.pumpAndSettle();

    // 3. Verify on Login screen
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
    expect(find.text('Lupa Kata Sandi?'), findsOneWidget);

    // 4. Tap "Lupa Kata Sandi?" -> Navigates to ForgotPasswordScreen
    await tester.tap(find.text('Lupa Kata Sandi?'));
    await tester.pumpAndSettle();

    // 5. Verify ForgotPasswordScreen
    expect(find.text('Lupa Password?'), findsOneWidget);
    expect(find.text('Email atau Nomor Handphone.'), findsOneWidget);
    expect(find.text('Kirim Kode OTP'), findsOneWidget);

    // Fill email and submit
    await tester.enterText(find.byType(TextFormField).first, 'user@benevo.id');
    await tester.tap(find.text('Kirim Kode OTP'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    // 6. Verify OtpVerificationScreen
    expect(find.text('Lupa Password?'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(6));

    // Fill all 6 OTP digits
    final otpFields = find.byType(TextFormField);
    for (int i = 0; i < 6; i++) {
      await tester.enterText(otpFields.at(i), '${i + 1}');
    }
    await tester.pumpAndSettle();

    // Tap "Kirim Kode OTP" to verify
    await tester.tap(find.text('Kirim Kode OTP'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1500));
    await tester.pumpAndSettle();

    // 7. Verify ResetPasswordScreen
    expect(find.text('Reset Password'), findsWidgets);
    expect(find.text('New Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    // Fill new password and confirm password
    final passwordFields = find.byType(TextFormField);
    await tester.enterText(passwordFields.at(0), 'password123');
    await tester.enterText(passwordFields.at(1), 'password123');
    await tester.pumpAndSettle();

    // Tap "Reset Password" button
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reset Password'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pumpAndSettle();

    // 8. Verify back on Login screen
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
  });
}
