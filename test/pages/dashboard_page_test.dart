import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freedomcity/pages/dashboard_page.dart';
import 'package:freedomcity/pages/messages_page.dart';

void main() {
  testWidgets('Button is pressed and navigates to messages page', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DashboardPage())));

    expect(find.text('Messages'), findsOneWidget);
    await tester.tap(find.text('Messages'));
    await tester.pumpAndSettle();

    expect(find.byType(MessagesPage), findsOneWidget);
  });
}
