import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../../lib/main.dart';
import '../set_steps.dart';

void runPageControlLinerScreen(Device device) {
  testGoldens('page_control_liner_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Liner Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Liner'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_liner_light_screen_${device.name}',
    );
  });

  testGoldens('page_control_liner_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Liner Darl screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Liner'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_liner_dark_screen_${device.name}',
    );
  });

  testGoldens('page_control_liner_one_item_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Liner One Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Liner'
          );
          await tester.pump(const Duration(milliseconds: 150));
          final Finder finderItem = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.text('One'),
          );
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_liner_one_screen_${device.name}',
    );
  });

  testGoldens('page_control_liner_two_item_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Liner Two Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Liner'
          );
          await tester.pump(const Duration(milliseconds: 150));
          final Finder finderItem = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.text('Two'),
          );
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_liner_two_item_screen_${device.name}',
    );
  });

  testGoldens('page_control_liner_three_item_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Liner Three Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Liner'
          );
          await tester.pump(const Duration(milliseconds: 150));
          final Finder finderItem = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.text('Three'),
          );
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_liner_three_item_screen_${device.name}',
    );
  });

  testGoldens(
    'page_control_liner_show_second_item_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Liner Show Second Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Liner'
          );
          await tester.pump(const Duration(milliseconds: 150));
          final Finder finderItem = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_arrow_right_outline),
          );
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_liner_show_second_item_screen_${device.name}',
    );
  });

  testGoldens(
    'page_control_liner_show_third_item_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Liner Show Third Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Liner'
          );
          await tester.pump(const Duration(milliseconds: 150));
          final Finder finderItem = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(AdmiralIcons.admiral_ic_arrow_right_outline),
          );
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_liner_show_third_item_screen_${device.name}',
    );
  });
}
