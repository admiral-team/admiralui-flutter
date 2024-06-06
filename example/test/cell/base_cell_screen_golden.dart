import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runBaseCellScreen(Device device) {
  // Leading Elements
  testGoldens('leading_elements_cell_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Leading Elements Cell Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Leading elements'
          );
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'leading_elements_cell_light_screen_${device.name}',
    );
  });

  testGoldens(
    'leading_elements_cell_disabled_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Leading Elements Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Leading elements'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'leading_elements_cell_disabled_light_screen_${device.name}',
    );
  });

  testGoldens('leading_elements_cell_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Leading Elements Cell Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Leading elements'
          );
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'leading_elements_cell_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'leading_elements_cell_disabled_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Leading Elements Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Leading elements'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'leading_elements_cell_disabled_dark_screen_${device.name}',
    );
  });

  // Center Elements
  testGoldens('center_elements_cell_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Center Elements Cell Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center elements'
          );
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'center_elements_cell_light_screen_${device.name}',
    );
  });

  testGoldens(
    'center_elements_cell_disabled_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Center Elements Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center elements'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'center_elements_cell_disabled_light_screen_${device.name}',
    );
  });

  testGoldens('center_elements_cell_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Center Elements Cell Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center elements'
          );
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'center_elements_cell_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'center_elements_cell_disabled_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Center Elements Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Center elements'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'center_elements_cell_disabled_dark_screen_${device.name}',
    );
  });

  // Trailing elements
  testGoldens('trailing_elements_cell_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Trailing Elements Cell Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Trailing elements'
          );
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'trailing_elements_cell_light_screen_${device.name}',
    );
  });

  testGoldens(
    'trailing_elements_cell_disabled_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Trailing Elements Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Trailing elements'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'trailing_elements_cell_disabled_light_screen_${device.name}',
    );
  });

  testGoldens('trailing_elements_cell_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Trailing Elements Cell Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Trailing elements'
          );
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'trailing_elements_cell_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'trailing_elements_cell_disabled_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Trailing Elements Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Base Cells');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Trailing elements'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'trailing_elements_cell_disabled_dark_screen_${device.name}',
    );
  });

}