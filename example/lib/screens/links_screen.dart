import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinksScreen extends StatelessWidget {
  const LinksScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;

    return Scaffold(
      appBar: appBarHidden
          ? null
          : AppBar(
              leading: CupertinoButton(
                child: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.of(context).pop(),
              ),
              bottomOpacity: 0.0,
              elevation: 0.0,
              backgroundColor: colors.backgroundBasic.color(),
            ),
      body: Container(
        color: colors.backgroundBasic.color(),
        padding: EdgeInsets.all(
          LayoutGrid.doubleModule,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '24 Links',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LinkControl(
                  title: 'Link',
                  icon: AdmiralIcons.admiral_ic_arrow_left_outline,
                  iconPosition: IconPosition.left,
                  style: LinkStyle.medium,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  icon: AdmiralIcons.admiral_ic_arrow_right_outline,
                  iconPosition: IconPosition.right,
                  style: LinkStyle.medium,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  style: LinkStyle.medium,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '16 Links',
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                LinkControl(
                  title: 'Link',
                  icon: AdmiralIcons.admiral_ic_arrow_left_outline,
                  iconPosition: IconPosition.left,
                  style: LinkStyle.normal,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  icon: AdmiralIcons.admiral_ic_arrow_right_outline,
                  iconPosition: IconPosition.right,
                  style: LinkStyle.normal,
                ),
                SizedBox(width: LayoutGrid.quadrupleModule),
                LinkControl(
                  title: 'Link',
                  style: LinkStyle.normal,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
