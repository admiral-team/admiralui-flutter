import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runSliderTextFieldsScreen(Device device) {
  // Light Theme
  testGoldens('slider_textfields_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_light_screen_${device.name}',
    );
  });

  testGoldens('slider_textfields_error_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Error Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_error_light_screen_${device.name}',
    );
  });

  testGoldens('slider_textfields_disabled_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_disabled_light_screen_${device.name}',
    );
  });

  // Dark Theme
  testGoldens('slider_textfields_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_dark_screen_${device.name}',
    );
  });

  testGoldens('slider_textfields_error_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Error Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_error_dark_screen_${device.name}',
    );
  });

  testGoldens('slider_textfields_disabled_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Disabled Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_disabled_dark_screen_${device.name}',
    );
  });

  // Unique cases
  testGoldens('slider_textfields_enter_text', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Enter Text',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('sliderTextField'));
          await tester.enterText(finder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');
          
          await tester.pump(new Duration(milliseconds: 50));
          final Finder leadingFinder = find.byKey(
            const Key('leadingTextField')
          );
          await tester.enterText(leadingFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder trailingFinder = find.byKey(
            const Key('trailingTextField')
          );
          await tester.enterText(trailingFinder,
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.''');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_enter_text_screen_${device.name}',
    );
  });

  testGoldens('slider_textfields_enter_numbers', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Enter Numbers',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('sliderTextField'));
          await tester.enterText(finder, '50');
              
          await tester.pump(new Duration(milliseconds: 50));
          final Finder leadingFinder = find.byKey(
            const Key('leadingTextField')
          );
          await tester.enterText(leadingFinder, '50');
          await tester.pump(new Duration(milliseconds: 50));
          final Finder trailingFinder = find.byKey(
            const Key('trailingTextField')
          );
          await tester.enterText(trailingFinder, '50');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_enter_numbers_screen_${device.name}',
    );
  });

  testGoldens('slider_textfields_enter_numbers_disabled', (
    WidgetTester tester
  ) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Slider Textfields Enter Numbers Disabled',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Slider');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Disabled');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('sliderTextField'));
          await tester.enterText(finder, '50');
              
          await tester.pump(new Duration(milliseconds: 50));
          final Finder leadingFinder = find.byKey(
            const Key('leadingTextField')
          );
          await tester.enterText(leadingFinder, '50');
          await tester.pump(new Duration(milliseconds: 50));
          final Finder trailingFinder = find.byKey(
            const Key('trailingTextField')
          );
          await tester.enterText(trailingFinder, '50');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'slider_textfields_enter_numbers_disabled_screen_${device.name}',
    );
  });

}