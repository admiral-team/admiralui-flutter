import '../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import 'set_steps.dart';

void runShimmerScreen(Device device) {
  testGoldens('shimmer_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Shimmer Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Shimmers');
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'shimmer_light_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });


  testGoldens('shimmer_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Shimmer Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Shimmers');
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'shimmer_dark_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });
}