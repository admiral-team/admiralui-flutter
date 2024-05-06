import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// ignore: avoid_relative_lib_imports
import '../set_steps.dart';

void runPincodeScreen(Device device) {
  // Light Theme
  testGoldens('pincode_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Pincode Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finder,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();

          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_textfields_light_screen_${device.name}',
    );
  });

  testGoldens('pincode_success_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Pincode Success Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finder,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Success');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_success_light_screen_${device.name}',
    );
  });

  testGoldens('pincode_error_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Pincode Error Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finder,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_error_light_screen_${device.name}',
    );
  });

  // Dark Theme
  testGoldens('pincode_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Pincode Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finder,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_textfields_dark_screen_${device.name}',
    );
  });

  testGoldens('pincode_success_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Pincode Success Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finder,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Success');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_success_dark_screen_${device.name}',
    );
  });

  testGoldens('pincode_error_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Pincode Error Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await changeTheme(tester, scenarioWidgetKey);
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finder = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finder,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderType = find.text('Error');
          await tester.tap(finderType);
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_error_dark_screen_${device.name}',
    );
  });

  // Unique case
  testGoldens('pincode_tap_buttons_minus', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tap minus',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderCell = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finderCell,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

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
      'pincode_tap_buttons_minus_screen_${device.name}',
    );
  });

  // Когда Иван поправит - раскоментить
  // testGoldens('pincode_tap_buttons_plus', (WidgetTester tester) async {
  //   final DeviceBuilder builder = DeviceBuilder()
  //     ..overrideDevicesForAllScenarios(devices: <Device>[device])
  //     ..addScenario(
  //       widget: const MyApp(),
  //       name: 'Tap plus',
  //       onCreate: (Key scenarioWidgetKey) async {
  //         await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

  //         await tester.pump(new Duration(milliseconds: 50));
  //         final Finder finderCell = find.byKey(const Key('cellSlider'));
  //         await tester.drag(
  //           finderCell,
  //           Offset(0, -150),
  //         );
  //         await tester.pumpAndSettle();
  //         await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

  //         await tester.pump(const Duration(milliseconds: 50));
  //         final Finder finder = find.byKey(const Key('plusInputButton'));
  //         for (int i = 0; i < 10; i++) {
  //           await tester.tap(finder);
  //           await tester.pump(const Duration(milliseconds: 50));
  //         }
  //       },
  //     );

  //   await tester.pumpDeviceBuilder(builder);
  //   await screenMatchesGolden(
  //     tester,
  //     'pincode_tap_buttons_plus_screen_${device.name}',
  //   );
  // });

  testGoldens('pincode_tap_one_to_five', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tap plus',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderCell = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finderCell,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.byKey(const Key('minusInputButton'));
          for (int i = 0; i < 10; i++) {
            await tester.tap(finderMinus);
            await tester.pump(const Duration(milliseconds: 50));
          }
          final Finder finderPlus = find.byKey(const Key('plusInputButton'));
          for (int i = 0; i < 6; i++) {
            await tester.tap(finderPlus);
            await tester.pump(const Duration(milliseconds: 50));
          }

          final Finder deleteFinder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(Icons.backspace_outlined),
          );
          for (int i = 0; i < 10; i++) {
            await tester.tap(deleteFinder);
          }

          for (int i = 1; i < 6; i++) {
            final Finder finderMenu = find.text('$i');
            await tester.tap(finderMenu);
            await tester.pump(const Duration(milliseconds: 50));
          }
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_tap_one_to_five_screen_${device.name}',
    );
  });

  testGoldens('pincode_tap_six_to_zero', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Tap plus',
        onCreate: (Key scenarioWidgetKey) async {
          await searchAndGo(tester, scenarioWidgetKey, 'Text fields');

          await tester.pump(new Duration(milliseconds: 50));
          final Finder finderCell = find.byKey(const Key('cellSlider'));
          await tester.drag(
            finderCell,
            Offset(0, -150),
          );
          await tester.pumpAndSettle();
          await selectSecondaryMenu(tester, scenarioWidgetKey, 'Pincode');

          await tester.pump(const Duration(milliseconds: 50));
          final Finder finderMinus = find.byKey(const Key('minusInputButton'));
          for (int i = 0; i < 10; i++) {
            await tester.tap(finderMinus);
            await tester.pump(const Duration(milliseconds: 50));
          }
          final Finder finderPlus = find.byKey(const Key('plusInputButton'));
          for (int i = 0; i < 5; i++) {
            await tester.tap(finderPlus);
            await tester.pump(const Duration(milliseconds: 50));
          }

          final Finder deleteFinder = find.descendant(
            of: find.byKey(scenarioWidgetKey),
            matching: find.byIcon(Icons.backspace_outlined),
          );
          for (int i = 0; i < 10; i++) {
            await tester.tap(deleteFinder);
          }

          for (int i = 6; i < 9; i++) {
            final Finder finderText = find.text('$i');
            await tester.tap(finderText);
            await tester.pump(const Duration(milliseconds: 50));
          }

          final Finder finderText = find.text('0');
          await tester.tap(finderText);
          await tester.pump(const Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'pincode_tap_six_to_zero_screen_${device.name}',
    );
  });
}
