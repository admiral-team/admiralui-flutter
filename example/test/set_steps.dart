import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> searchAndGo(
  WidgetTester tester,
  Key scenarioWidgetKey,
  String searchText,
) async {
  final Finder finder = find.byKey(const Key('mainSearchBar'));
  await tester.enterText(finder, searchText);

  await tester.pump(const Duration(milliseconds: 50));

  final Finder finderCell = find.byWidgetPredicate((Widget widget) {
    if (widget is BaseCellWidget) {
      return true;
    }
    return false;
  });
  await tester.tap(finderCell);
}

Future<void> changeTheme(
  WidgetTester tester,
  Key scenarioWidgetKey,
) async {
  final Finder floatingCicrcle = find.descendant(
    of: find.byKey(scenarioWidgetKey),
    matching: find.byIcon(AdmiralIcons.admiral_ic_menu_outline),
  );
  final Finder darkThemeButton = find.descendant(
    of: find.byKey(scenarioWidgetKey),
    matching: find.text('Dark'),
  );
  final Finder floatingClose = find.descendant(
    of: find.byKey(scenarioWidgetKey),
    matching: find.byIcon(AdmiralIcons.admiral_ic_close_outline),
  );
  await tester.tap(floatingCicrcle);
  await tester.pump(const Duration(milliseconds: 50));
  await tester.tap(darkThemeButton);
  await tester.pump(const Duration(milliseconds: 50));
  await tester.tap(floatingClose);
  await tester.pump(const Duration(milliseconds: 50));
}

Future<void> setDisabledState(
  WidgetTester tester,
  Key scenarioWidgetKey,
) async {
  await tester.pump(const Duration(milliseconds: 50));

  final Finder finderDisabled = find.descendant(
    of: find.byKey(scenarioWidgetKey),
    matching: find.text('Disabled'),
  );
  await tester.tap(finderDisabled);
}

Future<void> selectSecondaryMenu(
  WidgetTester tester,
  Key scenarioWidgetKey,
  String menu,
) async {
  await tester.pump(const Duration(milliseconds: 50));

  final Finder finderMenu = find.text(menu);
  await tester.tap(finderMenu);
}
