import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runAlertViewScreen(Device device) {
  testGoldens('alert_view_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Alert View Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Alert'
          ); 
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'alert_view_light_screen_${device.name}',
    );
  });

  testGoldens('alert_view_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Alert View Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Alert'
          ); 
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'alert_view_dark_screen_${device.name}',
    );
  });

  // Показ алерта
  testGoldens('alert_view_show_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Alert Show View Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Alert'
          ); 
          await tester.pump(new Duration(milliseconds: 50));

          final Finder buttonFinder = find.byKey(const Key('showAlertButton'));
          await tester.tap(buttonFinder);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'alert_view_show_light_screen_${device.name}',
    );
  });

  testGoldens('alert_view_show_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Alert Show View Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Alert'
          ); 
          await tester.pump(new Duration(milliseconds: 50));

          final Finder buttonFinder = find.byKey(const Key('showAlertButton'));
          await tester.tap(buttonFinder);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'alert_view_show_dark_screen_${device.name}',
    );
  });

  // Тестирование кнопок в alert
  testGoldens('alert_view_tap_button_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Alert Show View Light Tap Good screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Alert'
          ); 
          await tester.pump(new Duration(milliseconds: 50));

          final Finder buttonFinder = find.byKey(const Key('showAlertButton'));
          await tester.tap(buttonFinder);
          await tester.pump(new Duration(milliseconds: 50));

          final Finder finder = find.byKey(const Key('alertViewButtonAction'));
          await tester.tap(finder);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'alert_view_tap_button_screen_${device.name}',
    );
  });

  testGoldens(
    'alert_view_tap_additional_button_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Alert Show View Light Tap Good screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Alert'
          ); 
          await tester.pump(new Duration(milliseconds: 50));

          final Finder buttonFinder = find.byKey(const Key('showAlertButton'));
          await tester.tap(buttonFinder);
          await tester.pump(new Duration(milliseconds: 50));

          final Finder finder = find.byKey(
            const Key('alertViewAdditionalButton')
          );
          await tester.tap(finder);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'alert_view_tap_additional_button_screen_${device.name}',
    );
  });

}