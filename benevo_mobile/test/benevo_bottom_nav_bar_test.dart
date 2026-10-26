import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/home/widgets/benevo_bottom_nav_bar.dart';

void main() {
  testWidgets('BenevoBottomNavBar renders all 5 icons and handles taps', (WidgetTester tester) async {
    int selectedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: StatefulBuilder(
            builder: (context, setState) {
              return BenevoBottomNavBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
          ),
        ),
      ),
    );

    // Verify all 5 custom icons exist
    expect(find.byType(BenevoHomeIcon), findsOneWidget);
    expect(find.byType(BenevoDonationIcon), findsOneWidget);
    expect(find.byType(BenevoHistoryIcon), findsOneWidget);
    expect(find.byType(BenevoHeartNavIcon), findsOneWidget);
    expect(find.byType(BenevoProfileIcon), findsOneWidget);

    // Initial state: index 0
    expect(selectedIndex, 0);

    // Tap Donation tab (index 1)
    await tester.tap(find.byType(BenevoDonationIcon));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();
    expect(selectedIndex, 1);

    // Tap History tab (index 2)
    await tester.tap(find.byType(BenevoHistoryIcon));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();
    expect(selectedIndex, 2);

    // Tap Heart tab (index 3)
    await tester.tap(find.byType(BenevoHeartNavIcon));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();
    expect(selectedIndex, 3);

    // Tap Profile tab (index 4)
    await tester.tap(find.byType(BenevoProfileIcon));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();
    expect(selectedIndex, 4);

    // Tap Home tab (index 0)
    await tester.tap(find.byType(BenevoHomeIcon));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();
    expect(selectedIndex, 0);
  });
}
