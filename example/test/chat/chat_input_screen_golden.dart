import 'package:example/navigation/tab_item.dart';
import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import '../set_steps.dart';

void runChatInputScreen(Device device) {
  testGoldens('chat_input_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_light_screen_${device.name}',
    );
  });

  testGoldens('chat_input_light_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_light_disabled_screen_${device.name}',
    );
  });

  testGoldens('chat_input_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await changeTheme(tester, scenarioWidgetKey);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_dark_screen_${device.name}',
    );
  });

  testGoldens('chat_input_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Light Disabled screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await changeTheme(tester, scenarioWidgetKey);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_dark_disabled_screen_${device.name}',
    );
  });

  // Unique Cases
  // Setting many letters
  testGoldens('chat_input_many_letters_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Many Letters',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('chatInput'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_many_letters_${device.name}',
    );
  });

  // Setting letters
  testGoldens('chat_input_set_letters_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Set Letters',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('chatInput'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_set_letters_${device.name}',
    );
  });

  // Send Message
  testGoldens('chat_input_send_message_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Send Message',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');

          await tester.pump(new Duration(milliseconds: 50));

          final Finder finder = find.byKey(const Key('chatInput'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet'''
          );
          final Finder finderSendButton = find.byKey(
            const Key('chatInputButton')
          );
          await tester.ensureVisible(finderSendButton);
          await tester.pumpAndSettle();
          await tester.tap(finderSendButton);

          await tester.pump(new Duration(milliseconds: 150));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_send_message_${device.name}',
    );
  });

  // Setting letters if disabled
  testGoldens('chat_input_set_letters_disabled_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Set Letters Disabled',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');
          await setDisabledState(tester, scenarioWidgetKey);

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('chatInput'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_set_letters_disabled_${device.name}',
    );
  });

  // Send Message if disabled
  testGoldens('chat_input_send_message_disabled_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Input Send Message Disabled',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Input');
          await setDisabledState(tester, scenarioWidgetKey);

          await tester.pump(new Duration(milliseconds: 50));

          final Finder finder = find.byKey(const Key('chatInput'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet'''
          );
          final Finder finderSendButton = find.byKey(
            const Key('chatInputButton')
          );
          await tester.ensureVisible(finderSendButton);
          await tester.pumpAndSettle();
          await tester.tap(finderSendButton);

          await tester.pump(new Duration(milliseconds: 150));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_input_send_message_disabled_${device.name}',
    );
  });
}