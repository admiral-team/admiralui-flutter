import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runIconTabsScreen(Device device) {
  testGoldens('icon_tabs_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Icon Tabs Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Icon Tabs'
          );
          await tester.pumpAndSettle(const Duration(milliseconds: 300));
          await tester.pump(const Duration(milliseconds: 200));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'icon_tabs_light_screen_${device.name}',
    );
  });

  testGoldens('icon_tabs_light_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Icon Tabs Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Icon Tabs'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pumpAndSettle(const Duration(milliseconds: 300));
          await tester.pump(const Duration(milliseconds: 200));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'icon_tabs_light_disabled_screen_${device.name}',
    );
  });

  testGoldens('icon_tabs_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Icon Tabs Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Icon Tabs'
          );
          await tester.pumpAndSettle(const Duration(milliseconds: 300));
          await tester.pump(const Duration(milliseconds: 200));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'icon_tabs_dark_screen_${device.name}',
    );
  });

  testGoldens('icon_tabs_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Icon Tabs Dark Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Icon Tabs'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pumpAndSettle(const Duration(milliseconds: 300));
          await tester.pump(const Duration(milliseconds: 200));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'icon_tabs_dark_disabled_screen_${device.name}',
    );
  });

}
