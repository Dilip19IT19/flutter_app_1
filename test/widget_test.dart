import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/app/app.dart';

void main()
{
  testWidgets("Hello World Test",(WidgetTester tester) async{
    await tester.pumpWidget(const MyWidget());
    expect(find.byType(Container), findsOneWidget);
    expect(find.text("Hello World I am Dilip Choudhary"),findsOneWidget);
  } );
}