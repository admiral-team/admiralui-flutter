import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runTextBlockAccordionScreen(Device device) {
  testGoldens('text_block_accordion_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Text Block Accordion Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text Blocks');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Accordion'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'text_block_accordion_screen_${device.name}',
    );
  });

  testGoldens(
    'text_block_accordion_light_disabled_app',(WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Text Block Accordion Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text Blocks');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Accordion'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'text_block_accordion_light_disabled_screen_${device.name}',
    );
  });

  testGoldens('text_block_accordion_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Text Block Accordion Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text Blocks');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Accordion'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'text_block_accordion_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'text_block_accordion_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Text Block Accordion Dark Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text Blocks');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Accordion'
          );
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'text_block_accordion_dark_disabled_screen_${device.name}',
    );
  });
}