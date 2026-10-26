import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/features/fundraiser/screens/fundraiser_screen.dart';

void main() {
  testWidgets('FundraiserScreen renders hero, steps, tips, and cta', (WidgetTester tester) async {
    bool backTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: FundraiserScreen(
          onBackToHome: () {
            backTapped = true;
          },
        ),
      ),
    );

    // Verify Brand Logo in RichText (exactly "Benevo")
    expect(
      find.byWidgetPredicate(
        (widget) => widget is RichText && widget.text.toPlainText().trim() == 'Benevo',
      ),
      findsOneWidget,
    );

    // Verify Hero texts
    expect(find.text('Galang Dana untuk semua\nyang membutuhkan!'), findsOneWidget);
    expect(find.text('Galang dana sekarang!'), findsOneWidget);

    // Verify Cara Galang dana section
    expect(find.text('Cara Galang dana di Benevo'), findsOneWidget);
    expect(find.text('Pilih jenis galang dana'), findsOneWidget);
    expect(find.text('Isi form pembuatan dana'), findsOneWidget);
    expect(find.text('Verifikasi Galang dana kamu'), findsOneWidget);

    // Verify Tips section
    expect(find.text('Tips Galang dana'), findsOneWidget);
    expect(find.text('Verifikasi Identitas & dokumen'), findsOneWidget);
    expect(find.text('Sebarkan galang dana kamu sesering mungkin'), findsOneWidget);

    // Verify CTA Section
    expect(find.text('Sudah tahu tata caranya, kan?'), findsOneWidget);
    expect(find.text('Galang Dana Sekarang'), findsOneWidget);

    // Tap back button
    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pump();
    expect(backTapped, isTrue);
  });
}
