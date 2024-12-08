import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../../lib/main.dart';
import '../set_steps.dart';

void runSmallInformerScreen(Device device) {
  testGoldens('small_informer_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Small Informer Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(
            tester, 
            scenarioWidgetKey, 
            'Informers & Notifications'
          );
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Informers');
          await selectSecondaryMenu(
              tester, 
              scenarioWidgetKey, 
              'Small Informers'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'small_informer_light_screen_${device.name}',
    );
  });

  testGoldens('small_informer_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Small Informer Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(
            tester, 
            scenarioWidgetKey, 
            'Informers & Notifications'
          );
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Informers');
          await selectSecondaryMenu(
              tester, 
              scenarioWidgetKey, 
              'Small Informers'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'small_informer_dark_screen_${device.name}',
    );
  });
}
