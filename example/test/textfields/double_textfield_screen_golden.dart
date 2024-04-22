import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runDoubleTextFieldsScreen(Device device) {
  // Light Theme
  testGoldens('double_textfields_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_light_screen_${device.name}',
    );
  });

  testGoldens('double_textfields_read_only_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Read Only Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Read Only');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_read_only_light_screen_${device.name}',
    );
  });

  testGoldens('double_textfields_error_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Error Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_error_light_screen_${device.name}',
    );
  });

  testGoldens('double_textfields_disabled_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_disabled_light_screen_${device.name}',
    );
  });

  // Dark Theme
  testGoldens('double_textfields_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_dark_screen_${device.name}',
    );
  });

  testGoldens('double_textfields_read_only_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Read Only Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Read Only');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_read_only_dark_screen_${device.name}',
    );
  });

  testGoldens('double_textfields_error_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Error Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_error_dark_screen_${device.name}',
    );
  });

  testGoldens('double_textfields_disabled_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Disabled Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfields_disabled_dark_screen_${device.name}',
    );
  });

  // Unique Cases
  // Setting many letters
  testGoldens('double_textfield_many_letters_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields Many Letters',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('firstDoubleTextField'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder secondFinder = 
          find.byKey(const Key('secondDoubleTextField'));
          await tester.enterText(secondFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder thirdFinder = 
          find.byKey(const Key('thirdDoubleTextField'));
          await tester.enterText(thirdFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder fourFinder = 
          find.byKey(const Key('fourDoubleTextField'));
          await tester.enterText(fourFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfield_many_letters_${device.name}',
    );
  });

  // Setting text if disabled
  testGoldens('double_textfield_if_disabled_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Double Textfields If Disabled',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Double');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('firstDoubleTextField'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder secondFinder = 
          find.byKey(const Key('secondDoubleTextField'));
          await tester.enterText(secondFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder thirdFinder = 
          find.byKey(const Key('thirdDoubleTextField'));
          await tester.enterText(thirdFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder fourFinder = 
          find.byKey(const Key('fourDoubleTextField'));
          await tester.enterText(fourFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'double_textfield_if_disabled_${device.name}',
    );
  });

}