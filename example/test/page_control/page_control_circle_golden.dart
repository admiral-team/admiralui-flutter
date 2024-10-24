import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../../lib/main.dart';
import '../set_steps.dart';

void runPageControlCircleScreen(Device device) {
  testGoldens('page_control_circular_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Circular Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Circular'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_circular_light_screen_${device.name}',
    );
  });

  testGoldens('page_control_circular_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Circular Darl screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Circular'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_circular_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'page_control_circular_one_item_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Circular One Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Circular'
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
      'page_control_circular_one_screen_${device.name}',
    );
  });

  testGoldens(
    'page_control_circular_two_item_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Circular Two Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Circular'
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
      'page_control_circular_two_item_screen_${device.name}',
    );
  });

  testGoldens(
    'page_control_circular_three_item_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Circular Three Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Circular'
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
      'page_control_circular_three_item_screen_${device.name}',
    );
  });

  testGoldens(
    'page_control_circular_show_second_item_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Circular Show Second Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Circular'
          );
          await tester.pump(const Duration(milliseconds: 150));
          final Finder finderItem = find.byKey(Key('circularPageControl'));
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_circular_show_second_item_screen_${device.name}',
    );
  });

  testGoldens(
    'page_control_circular_show_third_item_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Page Control Circular Show Third Item screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Page Controls');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Circular'
          );
          await tester.pump(const Duration(milliseconds: 150));
          final Finder finderItem = find.byKey(Key('circularPageControl'));
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
          await tester.tap(finderItem);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'page_control_circular_show_third_item_screen_${device.name}',
    );
  });
}
