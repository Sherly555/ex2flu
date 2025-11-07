

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App shows Project Exhibition title', (WidgetTester tester) async {
    // Build our app
    await tester.pumpWidget(const ProjectExhibitionApp());

    // Verify app bar title
    expect(find.text('Project Exhibition'), findsOneWidget);
  });

  testWidgets('Project list shows first project', (WidgetTester tester) async {
    await tester.pumpWidget(const ProjectExhibitionApp());

    // Verify first project item is present
    expect(find.text('AI-Powered Chatbot'), findsOneWidget);
  });

  testWidgets('Tap project opens detail page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProjectExhibitionApp());

    // Tap the first project
    await tester.tap(find.text('AI-Powered Chatbot'));
    await tester.pumpAndSettle();

    // Verify detail page shows up
    expect(find.text('Presented by: Team Innovators'), findsOneWidget);
  });
}
