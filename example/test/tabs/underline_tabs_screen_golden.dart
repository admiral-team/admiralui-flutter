import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runUnderlineTabsScreen(Device device) {
  testGoldens('underline_slider_tabs_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Tabs Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Slider'
          );
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_tabs_light_screen_${device.name}',
    );
  });

  testGoldens(
    'underline_slider_tabs_light_disabled_app', (WidgetTester tester) 
  async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Tabs Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Slider'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_tabs_light_disabled_screen_${device.name}',
    );
  });

  testGoldens('underline_slider_tabs_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Tabs Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Slider'
          );
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_tabs_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'underline_slider_tabs_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Tabs Dark Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Slider'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_tabs_dark_disabled_screen_${device.name}',
    );
  });

  // Center
  testGoldens(
    'underline_slider_center_tabs_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Center Tabs Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center'
          );
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_center_tabs_light_screen_${device.name}',
    );
  });

  testGoldens(
    'underline_slider_center_tabs_light_disabled_app', (WidgetTester tester) 
  async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Center Tabs Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_center_tabs_light_disabled_screen_${device.name}',
    );
  });

  testGoldens(
    'underline_slider_center_tabs_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Center Tabs Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center'
          );
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_center_tabs_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'underline_slider_center_tabs_dark_disabled_app', 
  (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Underline Slider Center Tabs Dark Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tabs');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Underline Tabs'
          );
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center'
          );
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pumpAndSettle(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'underline_slider_center_tabs_dark_disabled_screen_${device.name}',
    );
  });

}
