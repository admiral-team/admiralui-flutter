import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
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
          'Radiobutton',
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
            RadioGroup(
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
            RadioGroup(
              items: <String>[''],
              groupValue: '',
              isEnabled: isEnabled,
            ),
            RadioGroup(
              items: <String>['Text'],
              groupValue: 'Text',
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
            RadioGroup(
              items: <String>['', 'Text'],
              style: RadioButtonStyle.error,
              isEnabled: isEnabled,
            ),
          ],
        ),
      ),
    );
  }
}
