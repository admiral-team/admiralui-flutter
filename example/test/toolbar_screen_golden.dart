import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../lib/main.dart';
import 'set_steps.dart';

void runToolbarScreen(Device device) {
  testGoldens('toolbar_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_light_screen_${device.name}',
    );
  });

  testGoldens('toolbar_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_dark_screen_${device.name}',
    );
  });

  testGoldens('toolbar_second_select_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Second Select Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderWord = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.text('Пополнить'),
          );
          await tester.tap(finderWord);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_second_select_light_screen_${device.name}',
    );
  });

  testGoldens('toolbar_third_select_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Third Select Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderWord = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.text('Подробнее'),
          );
          await tester.tap(finderWord);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_third_select_light_screen_${device.name}',
    );
  });

  testGoldens('toolbar_fourth_select_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Fourth Select Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderWord = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_settings_outline),
          );
          await tester.tap(finderWord);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_fourth_select_light_screen_${device.name}',
    );
  });

  testGoldens('toolbar_second_select_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Second Select Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderWord = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.text('Пополнить'),
          );
          await tester.tap(finderWord);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_second_select_dark_screen_${device.name}',
    );
  });

  testGoldens('toolbar_third_select_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Third Select Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderWord = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.text('Подробнее'),
          );
          await tester.tap(finderWord);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_third_select_dark_screen_${device.name}',
    );
  });

  testGoldens('toolbar_fourth_select_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar Fourth Select Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderWord = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_settings_outline),
          );
          await tester.tap(finderWord);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_fourth_select_dark_screen_${device.name}',
    );
  });

  testGoldens('toolbar_three_elements_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar 3 Elements Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_minus_outline),
          );
          await tester.tap(finderMinus);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_three_elements_light_screen_${device.name}',
    );
  });

  testGoldens('toolbar_two_elements_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar 2 Elements Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_minus_outline),
          );
          await tester.tap(finderMinus);
          await tester.tap(finderMinus);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_two_elements_light_screen_${device.name}',
    );
  });

  testGoldens('toolbar_one_elements_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar 1 Elements Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_minus_outline),
          );
          await tester.tap(finderMinus);
          await tester.tap(finderMinus);
          await tester.tap(finderMinus);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_one_elements_light_screen_${device.name}',
    );
  });

  testGoldens('toolbar_three_elements_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar 3 Elements Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_minus_outline),
          );
          await tester.tap(finderMinus);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_three_elements_dark_screen_${device.name}',
    );
  });

  testGoldens('toolbar_two_elements_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar 2 Elements Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_minus_outline),
          );
          await tester.tap(finderMinus);
          await tester.tap(finderMinus);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_two_elements_dark_screen_${device.name}',
    );
  });

  testGoldens('toolbar_one_elements_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tool bar 1 Elements Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Tool bar');
          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_minus_outline),
          );
          await tester.tap(finderMinus);
          await tester.tap(finderMinus);
          await tester.tap(finderMinus);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'toolbar_one_elements_dark_screen_${device.name}',
    );
  });

}
