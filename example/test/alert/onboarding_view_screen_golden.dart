import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runOnboardingViewScreen(Device device) {
  testGoldens('onboarding_view_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Onboarding View Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Onboarding'
          ); 
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'onboarding_view_light_screen_${device.name}',
    );
  });

  testGoldens('onboarding_second_view_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Onboarding Second View Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Onboarding'
          ); 
          await tester.pump(new Duration(milliseconds: 50));
          
          final Finder onboardingButton = find.byKey(
            const Key('circularPageControlKey')
          );
          await tester.tap(onboardingButton);
          await tester.pumpAndSettle(new Duration(milliseconds: 250));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'onboarding_second_view_light_screen_${device.name}',
    );
  });

  testGoldens('onboarding_third_view_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Onboarding Third View Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Onboarding'
          ); 
          await tester.pump(new Duration(milliseconds: 50));
          
          final Finder onboardingButton = find.byKey(
            const Key('circularPageControlKey')
          );

          await tester.tap(onboardingButton);
          await tester.pump(new Duration(milliseconds: 50));

          await tester.tap(onboardingButton);
          await tester.pumpAndSettle(new Duration(milliseconds: 250));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'onboarding_third_view_light_screen_${device.name}',
    );
  });

  testGoldens('onboarding_view_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Onboarding View Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Onboarding'
          ); 
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'onboarding_view_dark_screen_${device.name}',
    );
  });

  testGoldens('onboarding_second_view_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Onboarding Second View Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Onboarding'
          ); 
          await tester.pump(new Duration(milliseconds: 50));
          
          final Finder onboardingButton = find.byKey(
            const Key('circularPageControlKey')
          );
          await tester.tap(onboardingButton);
          await tester.pumpAndSettle(new Duration(milliseconds: 250));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'onboarding_second_view_dark_screen_${device.name}',
    );
  });

  testGoldens('onboarding_third_view_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Onboarding Third View Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Alerts');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Onboarding'
          ); 
          await tester.pump(new Duration(milliseconds: 50));
          
          final Finder onboardingButton = find.byKey(
            const Key('circularPageControlKey')
          );

          await tester.tap(onboardingButton);
          await tester.pump(new Duration(milliseconds: 50));

          await tester.tap(onboardingButton);
          await tester.pumpAndSettle(new Duration(milliseconds: 250));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'onboarding_third_view_dark_screen_${device.name}',
    );
  });

}
