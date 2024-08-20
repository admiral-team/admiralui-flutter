import 'package:example/navigation/tab_item.dart';
import '../../lib/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import '../set_steps.dart';

void runChatPhotoUploadScreen(Device device) {
  testGoldens('chat_photo_uploading_light_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Photo Upload Light screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await selectSecondaryMenu(
              tester, scenarioWidgetKey, 'Uploading Photo');
          await tester.pump(new Duration(milliseconds: 250));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
      tester,
      'chat_photo_uploading_light_${device.name}',
      customPump: (WidgetTester tester) async => await tester.pump(
        const Duration(milliseconds: 250),
      ),
    );
  });

  testGoldens('chat_photo_uploading_dark_app', (WidgetTester tester) async {
    final DeviceBuilder builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: <Device>[device])
      ..addScenario(
        widget: const MyApp(),
        name: 'Chat Photo Uploading Dark screen',
        onCreate: (Key scenarioWidgetKey) async {
          await selectTab(tester, TabItem.chat);
          await changeTheme(tester, scenarioWidgetKey);
          await selectSecondaryMenu(
              tester, scenarioWidgetKey, 'Uploading Photo');
          await tester.pump(new Duration(milliseconds: 50));
        },
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(
        tester, 'chat_photo_uploading_dark_screen_${device.name}',
        customPump: (WidgetTester tester) async => await tester.pump(
              const Duration(milliseconds: 150),
            ));
  });
}

Future<void> setLoadingState(
  WidgetTester tester,
  Key scenarioWidgetKey,
) async {
  await tester.pump(const Duration(milliseconds: 50));

  final Finder finderLoading = find.descendant(
    of: find.byKey(scenarioWidgetKey),
    matching: find.text('Loading'),
  );
  await tester.tap(finderLoading);
}
