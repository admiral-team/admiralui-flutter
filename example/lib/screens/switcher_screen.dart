import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class SwitcherScreen extends StatefulWidget {
  const SwitcherScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<SwitcherScreen> createState() => _SwitcherScreenState();
}

class _SwitcherScreenState extends State<SwitcherScreen> {
  bool isEnabled = true;
  bool isFirstChecked = true;
  bool isSecondChecked = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Switcher',
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StandardTabs(
              <String>['Default', 'Disabled'],
              onTap: (String value) {
                setState(() {
                  isEnabled = value == 'Default';
                });
              },
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 10,
            ),
            TextView(
              isFirstChecked ? 'On' : 'Off',
              font: fonts.body1,
              textColorNormal: colors.textSecondary.color(),
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 5,
            ),
            Switcher(
              isEnabled: isEnabled,
              value: true,
              onChanged: (bool isChecked) {
                setState(() {
                  isFirstChecked = !isFirstChecked;
                });
              },
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 9,
            ),
            TextView(
              isSecondChecked ? 'On' : 'Off',
              font: fonts.body1,
              textColorNormal: colors.textSecondary.color(),
            ),
            SizedBox(
              height: LayoutGrid.halfModule * 5,
            ),
            Switcher(
              isEnabled: isEnabled,
              onChanged: (bool isChecked) {
                setState(() {
                  isSecondChecked = !isSecondChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
