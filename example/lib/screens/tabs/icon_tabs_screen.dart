import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../navigation/tab_navigator_home.dart';

class IconTabsScreen extends StatefulWidget {
  const IconTabsScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<IconTabsScreen> createState() => _IconTabsScreenState();
}

class _IconTabsScreenState extends State<IconTabsScreen> {
  bool isEnabled = true;
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: colors.elementSecondary.color(),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Rules',
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
        padding: const EdgeInsets.symmetric(
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
              height: LayoutGrid.module * 5,
            ),
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
            IconTabs(
              <IconTabItem>[
                IconTabItem('One', AdmiralIcons.admiral_ic_mobile_outline),
                IconTabItem('Two', AdmiralIcons.admiral_ic_card_outline),
              ],
              isEnabled: isEnabled,
            ),
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
            IconTabs(
              <IconTabItem>[
                IconTabItem('One', AdmiralIcons.admiral_ic_mobile_outline),
                IconTabItem('Two', AdmiralIcons.admiral_ic_card_outline),
                IconTabItem(
                    'Three', AdmiralIcons.admiral_ic_account_detail_outline),
              ],
              isEnabled: isEnabled,
            ),
          ],
        ),
      ),
    );
  }
}
