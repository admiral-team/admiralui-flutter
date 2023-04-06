import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinksScreen extends StatefulWidget {
  const LinksScreen({super.key, this.appBarHidden = false});

  final bool appBarHidden;

  @override
  State<LinksScreen> createState() => _LinksScreenState();
}

class _LinksScreenState extends State<LinksScreen> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      appBar: widget.appBarHidden
          ? null
          : AppBar(
              leading: CupertinoButton(
                child: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              bottomOpacity: 0.0,
              elevation: 0.0,
              backgroundColor: colors.backgroundBasic.color(),
              title: Text(
                'Links',
                style: theme.fonts.subtitle2.toTextStyle(
                  colors.textPrimary.color(),
                ),
              ),
            ),
      body: Container(
        color: colors.backgroundBasic.color(),
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
                  '24 Links',
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
                  '18 Links',
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
