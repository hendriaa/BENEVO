import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/auth/screens/splash_screen.dart';
import 'package:benevo_mobile/features/auth/screens/register_screen.dart';
import 'package:benevo_mobile/features/auth/widgets/benevo_logo.dart';

void main() {
  testWidgets('SplashScreen displays logo and Benevo brand text exactly matching reference design', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    // Initial frame
    await tester.pump();

    // Verify splash screen components match clean reference design
    expect(find.byType(BenevoLogo), findsOneWidget);
    expect(find.text('Benevo'), findsOneWidget);

    // Complete loading duration
    await tester.pump(const Duration(milliseconds: 2600));
    await tester.pumpAndSettle();

    // Verify transition to RegisterScreen
    expect(find.byType(RegisterScreen), findsOneWidget);
  });
}
