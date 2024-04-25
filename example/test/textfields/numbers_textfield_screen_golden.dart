import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runNumbersTextFieldsScreen(Device device) {
  // Light Theme
  testGoldens('number_default_textfields_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Default');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_default_textfields_light_screen_${device.name}',
    );
  });

  testGoldens('number_default_textfields_disabled_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Default');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_default_textfields_disabled_light_screen_${device.name}',
    );
  });

  testGoldens('number_secondary_textfields_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Secondary Textfields Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Secondary');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_secondary_textfields_light_screen_${device.name}',
    );
  });

  testGoldens('number_secondary_textfields_disabled_light_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Secondary Textfields Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Secondary');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_secondary_textfields_disabled_light_screen_${device.name}',
    );
  });

  // Dark Theme
  testGoldens('number_default_textfields_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Default');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_default_textfields_dark_screen_${device.name}',
    );
  });

  testGoldens('number_default_textfields_disabled_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Disabled Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Default');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_default_textfields_disabled_dark_screen_${device.name}',
    );
  });

  testGoldens('number_secondary_textfields_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Secondary Textfields Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Secondary');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_secondary_textfields_dark_screen_${device.name}',
    );
  });

  testGoldens('number_secondary_textfields_disabled_dark_app',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Secondary Textfields Disabled Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Secondary');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_secondary_textfields_disabled_dark_screen_${device.name}',
    );
  });

  // Unique case
  testGoldens('number_default_textfields_tab_buttons_minus',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Tab Plus Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Default');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('minusInputButton'));
          for (int i = 0; i < 10; i++) {
            await tester.tap(finder);
            await tester.pump(const Duration(milliseconds: 50));
          }
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_default_textfields_tab_buttons_minus_screen_${device.name}',
    );
  });

  testGoldens('number_default_textfields_tab_buttons_plus',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Default');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('plusInputButton'));
          for (int i = 0; i < 10; i++) {
            await tester.tap(finder);
            await tester.pump(const Duration(milliseconds: 50));
          }
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_default_textfields_tab_buttons_plus_screen_${device.name}',
    );
  });

  testGoldens('number_secondary_textfields_tab_buttons_minus',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Tab Plus Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Secondary');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('minusInputButton'));
          for (int i = 0; i < 10; i++) {
            await tester.tap(finder);
            await tester.pump(const Duration(milliseconds: 50));
          }
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_secondary_textfields_tab_buttons_minus_screen_${device.name}',
    );
  });

  testGoldens('number_secondary_textfields_tab_buttons_plus',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Textfields Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Secondary');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('plusInputButton'));
          for (int i = 0; i < 10; i++) {
            await tester.tap(finder);
            await tester.pump(const Duration(milliseconds: 50));
          }
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_secondary_textfields_tab_buttons_plus_screen_${device.name}',
    );
  });

  testGoldens('number_default_textfields_disabled_tap_plus',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Default Disabled Tap Plus',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Default');
          await setDisabledState(tester, scenarioWidgetKey);

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('plusInputButton'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_default_textfields_disabled_tap_plus_screen_${device.name}',
    );
  });


  testGoldens('number_secondary_textfields_disabled_tap_plus',
      (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Number Secondary Disabled Tap Plus',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Number');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Secondary');
          await setDisabledState(tester, scenarioWidgetKey);

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('plusInputButton'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'number_secondary_textfields_disabled_tap_plus_screen_${device.name}',
    );
  });
}
