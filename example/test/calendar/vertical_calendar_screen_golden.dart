import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runVerticalCalendarScreen(Device device) {
  testGoldens('vertical_calendar_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Vertical Calendar Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Calendar');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Vertical'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'vertical_calendar_light_screen_${device.name}',
    );
  });

  testGoldens('vertical_calendar_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Vertical Calendar Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Calendar');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Vertical'
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'vertical_calendar_dark_screen_${device.name}',
    );
  });

  testGoldens('vertical_calendar_set_range_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Vertical Calendar Set Range',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Calendar');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Vertical'
          );

          await tester.pump(const Duration(milliseconds: 50));
          final Finder startDateFinder = find.byKey(
            const Key('calendarDayView15012022')
          );
          await tester.tap(startDateFinder);

          await tester.pump(const Duration(milliseconds: 50));
          final Finder endDateFinder = find.byKey(
            const Key('calendarDayView30012022')
          );
          await tester.tap(endDateFinder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'vertical_calendar_set_range_screen_${device.name}',
    );
  });

  testGoldens(
    'vertical_calendar_set_range_dark_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Vertical Calendar Set Range Dark',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Calendar');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Vertical'
          );

          await tester.pump(const Duration(milliseconds: 50));
          final Finder startDateFinder = find.byKey(
            const Key('calendarDayView15012022')
          );
          await tester.tap(startDateFinder);

          await tester.pump(const Duration(milliseconds: 50));
          final Finder endDateFinder = find.byKey(
            const Key('calendarDayView30012022')
          );
          await tester.tap(endDateFinder);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'vertical_calendar_set_range_dark_screen_${device.name}',
    );
  });

  testGoldens(
    'vertical_calendar_set_range_and_select_center_app', 
    (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Vertical Calendar Set Range And Select Center',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Calendar');
          await selectSecondaryMenu(
            tester, scenarioWidgetKey, 'Vertical'
          );

          await tester.pump(const Duration(milliseconds: 50));
          final Finder startDateFinder = find.byKey(
            const Key('calendarDayView15012022')
          );
          await tester.tap(startDateFinder);

          await tester.pump(const Duration(milliseconds: 50));
          final Finder endDateFinder = find.byKey(
            const Key('calendarDayView30012022')
          );
          await tester.tap(endDateFinder);

          await tester.pump(const Duration(milliseconds: 50));
          final Finder centerDateFinder = find.byKey(
            const Key('calendarDayView25012022')
          );
          await tester.tap(centerDateFinder);

          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'vertical_calendar_set_range_and_select_center_screen_${device.name}',
    );
  });

}