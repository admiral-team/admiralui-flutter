import 'package:example/navigation/tab_item.dart';
import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import '../set_steps.dart';

void runTextMessageScreen(Device device) {
  testGoldens('chat_text_message_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Text Message Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Text Message');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_text_message_light_screen_${device.name}',
    );
  });

  testGoldens('chat_text_message_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Text Message Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await changeTheme(tester, scenarioWidgetKey);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Text Message');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_text_message_dark_screen_${device.name}',
    );
  });
}