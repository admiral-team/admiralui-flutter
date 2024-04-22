import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runSmsTextFieldsScreen(Device device) {
  // Light Theme
  testGoldens('sms_textfields_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Sms Textfields Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfields_light_screen_${device.name}',
    );
  });

  testGoldens('sms_textfields_error_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Sms Textfields Error Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfields_error_light_screen_${device.name}',
    );
  });

  testGoldens('sms_textfields_disabled_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'SMS Textfields Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfields_disabled_light_screen_${device.name}',
    );
  });

  // Dark Theme
  testGoldens('sms_textfields_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'SMS Textfields Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfields_dark_screen_${device.name}',
    );
  });

  testGoldens('sms_textfields_error_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'SMS Textfields Error Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfields_error_dark_screen_${device.name}',
    );
  });

  testGoldens('sms_textfields_disabled_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'SMS Textfields Disabled Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfields_disabled_dark_screen_${device.name}',
    );
  });

  // Unique Cases
  // Setting many letters
  testGoldens('sms_textfield_many_letters_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'SMS Textfields Many Letters',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('smsTextField'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfield_many_letters_${device.name}',
    );
  });

  /// Setting text if state disabled
  testGoldens('sms_textfield_set_text_read_only_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'SMS Textfields Read Only Setting Text',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'SMS Code');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('smsTextField'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'sms_textfield_set_text_read_only_${device.name}',
    );
  });

}
