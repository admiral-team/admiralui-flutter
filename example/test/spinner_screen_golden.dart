import '../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import 'set_steps.dart';

void runSpinnerScreen(Device device) {
  testGoldens('spinner_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Spinner Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Spinner');
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'spinner_light_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });

  testGoldens('spinner_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Spinner Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Spinner');
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'spinner_dark_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });

  testGoldens('spinner_medium_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Spinner Medium Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Spinner');
          await tester.pump(new Duration(milliseconds: 50));

          final Finder finderSize = find.text('Medium');
          await tester.tap(finderSize);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'spinner_medium_light_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });

  testGoldens('spinner_big_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Spinner Big Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Spinner');
          await tester.pump(new Duration(milliseconds: 50));

          final Finder finderSize = find.text('Big');
          await tester.tap(finderSize);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'spinner_big_light_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });

  testGoldens('spinner_medium_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Spinner Medium Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Spinner');
          await tester.pump(new Duration(milliseconds: 50));

          final Finder finderSize = find.text('Medium');
          await tester.tap(finderSize);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'spinner_medium_dark_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });

  testGoldens('spinner_big_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Spinner Big Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Spinner');
          await tester.pump(new Duration(milliseconds: 50));

          final Finder finderSize = find.text('Big');
          await tester.tap(finderSize);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'spinner_big_dark_screen_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });
}