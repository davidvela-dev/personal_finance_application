import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:personal_finance_application/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // build our app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // verify material app
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
