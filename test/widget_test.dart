import 'package:flutter_test/flutter_test.dart';
import 'package:dangdang_v2/app/app.dart';

void main() {
  testWidgets('DangDangApp builds', (WidgetTester tester) async {
    await tester.pumpWidget(const DangDangApp());
    expect(find.byType(DangDangApp), findsOneWidget);
  });
}
