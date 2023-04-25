import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        centerTitle: true,
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: TextView(
          'Checkbox',
          font: fonts.subtitle2,
          textColorNormal: colors.textPrimary.color(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            StandardTabs(
              <String>['Default', 'Disabled'],
              onTap: (String value) {
                setState(() {
                  isEnabled = value == 'Default';
                });
              },
            ),
            SizedBox(
              height: LayoutGrid.quadrupleModule,
            ),
            TextView(
              'Default',
              font: fonts.body1,
              textColorNormal: colors.textSecondary.color(),
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            CheckBoxGroup(
              items: <String>['', 'Text'],
              isEnabled: isEnabled,
            ),
            SizedBox(
              height: LayoutGrid.tripleModule,
            ),
            TextView(
              'Selected',
              font: fonts.body1,
              textColorNormal: colors.textSecondary.color(),
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            CheckBoxGroup(
              items: <String>[''],
              selectedValues: <String>[''],
              isEnabled: isEnabled,
            ),
            CheckBoxGroup(
              items: <String>['Text'],
              selectedValues: <String>['Text'],
              isEnabled: isEnabled,
            ),
            SizedBox(
              height: LayoutGrid.tripleModule,
            ),
            TextView(
              'Error',
              font: fonts.body1,
              textColorNormal: colors.textSecondary.color(),
            ),
            SizedBox(
              height: LayoutGrid.doubleModule,
            ),
            CheckBoxGroup(
              items: <String>['', 'Text'],
              style: CheckboxStyle.error,
              isEnabled: isEnabled,
            ),
          ],
        ),
      ),
    );
  }
}
