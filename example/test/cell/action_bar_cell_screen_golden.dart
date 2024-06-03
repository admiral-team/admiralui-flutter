import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runActionBarCellScreen(Device device) {
  testGoldens('action_bar_cell_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Cell Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_light_screen_${device.name}',
    );
  });

  testGoldens('action_bar_cell_disabled_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_disabled_light_screen_${device.name}',
    );
  });

  testGoldens('action_bar_cell_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Cell Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_dark_screen_${device.name}',
    );
  });

  testGoldens('action_bar_cell_disabled_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Cell Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_disabled_dark_screen_${device.name}',
    );
  });

  testGoldens('action_bar_cell_default_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Default Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await tester.pump(const Duration(milliseconds: 50));

          final Finder finder = find.byKey(
            const Key('baseCellWidgetSliderDefault')
          );
          await tester.drag(
            finder,
            Offset(-300, 0),
          );
          await tester.pumpAndSettle();
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_default_light_screen_${device.name}',
    );
  });

  testGoldens(
    'action_bar_cell_secondary_light_app',
  (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Secondary Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await tester.pump(const Duration(milliseconds: 50));

          final Finder finder = find.byKey(
            const Key('baseCellWidgetSliderSecondary')
          );
          await tester.drag(
            finder,
            Offset(-300, 0),
          );
          await tester.pumpAndSettle();
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_secondary_light_screen_${device.name}',
    );
  });

  testGoldens('action_bar_cell_default_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Default Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await tester.pump(const Duration(milliseconds: 50));

          final Finder finder = find.byKey(
            const Key('baseCellWidgetSliderDefault')
          );
          await tester.drag(
            finder,
            Offset(-300, 0),
          );
          await tester.pumpAndSettle();
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_default_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'action_bar_cell_secondary_dark_app',
  (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Secondary Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await tester.pump(const Duration(milliseconds: 50));

          final Finder finder = find.byKey(
            const Key('baseCellWidgetSliderSecondary')
          );
          await tester.drag(
            finder,
            Offset(-300, 0),
          );
          await tester.pumpAndSettle();
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_secondary_dark_screen_${device.name}',
    );
  });

  // Testing swipe if disabled
  testGoldens(
    'action_bar_cell_default_disabled_app', 
  (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Default Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pump(const Duration(milliseconds: 50));

          final Finder finder = find.byKey(
            const Key('baseCellWidgetSliderDefault')
          );
          await tester.drag(
            finder,
            Offset(-300, 0),
          );
          await tester.pumpAndSettle();
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_default_disabled_screen_${device.name}',
    );
  });

  testGoldens(
    'action_bar_cell_secondary_disabled_app',
  (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Action Bar Secondary Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Cells');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Actionbar');
          await setDisabledState(tester, scenarioWidgetKey);
          await tester.pump(const Duration(milliseconds: 50));

          final Finder finder = find.byKey(
            const Key('baseCellWidgetSliderSecondary')
          );
          await tester.drag(
            finder,
            Offset(-300, 0),
          );
          await tester.pumpAndSettle();
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'action_bar_cell_secondary_disabled_screen_${device.name}',
    );
  });

}
