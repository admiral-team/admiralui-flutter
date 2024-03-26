import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class LinksScreen extends StatefulWidget {
  const LinksScreen({super.key});

  @override
  State<LinksScreen> createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        backgroundColor: colors.backgroundBasic.color(),
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Links',
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        bottomOpacity: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '24 Link',
                  textAlign: TextAlign.left,
                  style: theme.fonts.body1.toTextStyle(
                    colors.textSecondary.color(),
                  ),
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LinkControl(
                  title: 'Link',
                  leadingImage: AdmiralIcons.admiral_ic_arrow_left_outline,
                  style: LinkStyle.medium,
                  isEnable: isEnabled,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  trailingImage: AdmiralIcons.admiral_ic_arrow_right_outline,
                  style: LinkStyle.medium,
                  isEnable: isEnabled,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  style: LinkStyle.medium,
                  isEnable: isEnabled,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.quadrupleModule),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  '18 Link',
                  textAlign: TextAlign.left,
                  style: theme.fonts.body1.toTextStyle(
                    colors.textSecondary.color(),
                  ),
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LinkControl(
                  title: 'Link',
                  leadingImage: AdmiralIcons.admiral_ic_arrow_left_outline,
                  style: LinkStyle.normal,
                  isEnable: isEnabled,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  trailingImage: AdmiralIcons.admiral_ic_arrow_right_outline,
                  style: LinkStyle.normal,
                  isEnable: isEnabled,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  style: LinkStyle.normal,
                  isEnable: isEnabled,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
