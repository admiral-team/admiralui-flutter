import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../example/lib/main.dart';
import 'set_steps.dart';

void runLinksScreen(Device device) {
  testGoldens('links_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Links Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Links');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'links_light_screen_${device.name}',
    );
  });

  testGoldens('links_light_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Links Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Links');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'links_light_disabled_screen_${device.name}',
    );
  });

  testGoldens('links_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Links Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Links');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'links_dark_screen_${device.name}',
    );
  });

  testGoldens('links_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Links Dark Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Links');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'links_dark_disabled_screen_${device.name}',
    );
  });
}
