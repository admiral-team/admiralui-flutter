import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runInformerTabsScreen(Device device) {
  testGoldens('informer_tabs_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Informer Tabs Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Informer Tabs'
          );
          await tester.pump(const Duration(milliseconds: 500));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'informer_tabs_light_screen_${device.name}',
    );
  });

  testGoldens('informer_tabs_light_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Informer Tabs Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Informer Tabs'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pump(const Duration(milliseconds: 500));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'informer_tabs_light_disabled_screen_${device.name}',
    );
  });

  testGoldens('informer_tabs_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Informer Tabs Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Informer Tabs'
          );
          await tester.pump(const Duration(milliseconds: 500));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'informer_tabs_dark_screen_${device.name}',
    );
  });

  testGoldens('informer_tabs_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Informer Tabs Dark Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Informer Tabs'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pump(const Duration(milliseconds: 500));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'informer_tabs_dark_disabled_screen_${device.name}',
    );
  });

}