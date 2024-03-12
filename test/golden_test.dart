import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../example/lib/main.dart';
import 'flutter_test_config.dart';

void main() {
  testExecutable(() {
    testWidgets('description', (WidgetTester tester) async {});

    testGoldens('app', (WidgetTester tester) async {
      await tester.pumpWidgetBuilder(const MyApp());
      await multiScreenGolden(
        tester,
        'home_page',
        devices: <Device>[
          const Device(
            name: 'iPhone SE',
            size: Size(375, 667),
          ),
          const Device(
            name: 'iPhone 14',
            size: Size(589, 1278),
          ),
          const Device(
            name: 'iPad',
            size: Size(1024, 1366),
          ),
        ],
      );
    });
  });
}
