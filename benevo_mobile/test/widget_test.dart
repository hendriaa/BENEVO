import 'package:flutter_test/flutter_test.dart';
import 'package:benevo_mobile/main.dart';

void main() {
  testWidgets('Register screen loads title test', (WidgetTester tester) async {
    await tester.pumpWidget(const BenevoApp());
    expect(find.text('Mulai Salurkan Kebaikan'), findsOneWidget);
    expect(find.text('Daftar'), findsOneWidget);
  });
}
