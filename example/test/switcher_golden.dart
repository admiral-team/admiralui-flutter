import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../lib/main.dart';
import 'set_steps.dart';

void runSwitcherScreen(Device device) {
  testGoldens('check_box_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Switcher Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Switcher');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'switcher_light_screen_${device.name}',
    );
  });

  testGoldens('switcher_light_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Switcher Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Switcher');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'switcher_light_disabled_screen_${device.name}',
    );
  });

  testGoldens('switcher_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Switcher Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Switcher');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'switcher_dark_screen_${device.name}',
    );
  });

  testGoldens('switcher_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Switcher Dark Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Switcher');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'switcher_dark_disabled_screen_${device.name}',
    );
  });

  /// Test for changing state switcheres
  testGoldens('change_switcher_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Change Switcher screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Switcher');

          await tester.pump(const Duration(milliseconds: 50));

          final Finder finderOnSwitcher =
              find.byWidgetPredicate((Widget widget) {
            if (widget is Switcher && widget.value) {
              return true;
            }
            return false;
          });
          final Finder finderOffSwitcher =
              find.byWidgetPredicate((Widget widget) {
            if (widget is Switcher && widget.value == false) {
              return true;
            }
            return false;
          });

          await tester.tap(finderOnSwitcher);
          await tester.tap(finderOffSwitcher);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'change_switcher_screen_${device.name}',
    );
  });

  /// Test for changing state switcheres, but screen state is disabled
  testGoldens('change_switcher_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Change Switcher Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Switcher');
          await setDisabledState(tester, scenarioWidgetKey);

          await tester.pump(const Duration(milliseconds: 50));

          final Finder finderOnSwitcher =
              find.byWidgetPredicate((Widget widget) {
            if (widget is Switcher && widget.value) {
              return true;
            }
            return false;
          });
          final Finder finderOffSwitcher =
              find.byWidgetPredicate((Widget widget) {
            if (widget is Switcher && widget.value == false) {
              return true;
            }
            return false;
          });

          await tester.tap(finderOnSwitcher);
          await tester.tap(finderOffSwitcher);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'change_switcher_disabled_screen_${device.name}',
    );
  });
}
