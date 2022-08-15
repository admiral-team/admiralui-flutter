import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
// ignore: avoid_relative_lib_imports
import '../example/lib/main.dart';

void main() {
  testWidgets('description', (WidgetTester tester) async {});
  testGoldens('app', (WidgetTester tester) async {
    const size = Size(414, 896);
    await tester.pumpWidgetBuilder(const MyApp(), surfaceSize: size);
    await screenMatchesGolden(tester, 'myApp');
  });
}
