import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class IconTabsScreen extends StatelessWidget {
  const IconTabsScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CupertinoButton(
          child: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          title,
          style: fonts.largeTitle1.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        color: colors.backgroundBasic.color(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextView(
                  'Two items',
                  font: theme.fonts.headline,
                  textColorNormal: theme.colors.textSecondary.color(),
                )
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            IconTabs(<IconTabItem>[
              IconTabItem('One', AdmiralIcons.admiral_ic_mobile_outline),
              IconTabItem('Two', AdmiralIcons.admiral_ic_card_outline),
            ]),
            SizedBox(height: LayoutGrid.quadrupleModule),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextView(
                  'Three items',
                  font: theme.fonts.headline,
                  textColorNormal: theme.colors.textSecondary.color(),
                )
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            IconTabs(<IconTabItem>[
              IconTabItem('One', AdmiralIcons.admiral_ic_mobile_outline),
              IconTabItem('Two', AdmiralIcons.admiral_ic_card_outline),
              IconTabItem(
                  'Three', AdmiralIcons.admiral_ic_account_detail_outline),
            ]),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
