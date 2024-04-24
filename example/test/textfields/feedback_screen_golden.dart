import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../../lib/main.dart';
import '../set_steps.dart';

void runFeedbackScreen(Device device) {
  testGoldens('feedback_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_light_screen_${device.name}',
    );
  });

  testGoldens('feedback_light_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback Disabled Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_disabled_light_screen_${device.name}',
    );
  });

  testGoldens('feedback_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_dark_screen_${device.name}',
    );
  });

  testGoldens('feedback_dark_disabled_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback Disabled Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');
          await setDisabledState(tester, scenarioWidgetKey);
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_disabled_dark_screen_${device.name}',
    );
  });

  testGoldens('feedback_one_star_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback one star screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('feedbackStarIcon0'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_one_star_screen_${device.name}',
    );
  });

  testGoldens('feedback_two_star_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback two star screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('feedbackStarIcon1'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_two_star_screen_${device.name}',
    );
  });

  testGoldens('feedback_three_star_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback three star screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('feedbackStarIcon2'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_three_star_screen_${device.name}',
    );
  });

  testGoldens('feedback_four_star_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback four star screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('feedbackStarIcon3'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_four_star_screen_${device.name}',
    );
  });

  testGoldens('feedback_five_star_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback five star screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('feedbackStarIcon4'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_five_star_screen_${device.name}',
    );
  });

  testGoldens(
    'feedback_set_disabled_and_select_star_app', (WidgetTester tester
  ) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Feedback Set Disabled and Select star screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Feedback');
          await setDisabledState(tester, scenarioWidgetKey);

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('feedbackStarIcon0'));
          await tester.tap(finder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'feedback_set_disabled_and_select_star_screen_${device.name}',
    );
  });

}
