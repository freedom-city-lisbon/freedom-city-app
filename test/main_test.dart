import 'package:flutter_test/flutter_test.dart';
import 'package:freedomcity/main.dart';
import 'package:freedomcity/pages/dashboard_page.dart';

void main() {
  group("$MyApp", () {
    testWidgets("Dashboard is displayed", (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byType(DashboardPage), findsOneWidget);
    });
  });
}
