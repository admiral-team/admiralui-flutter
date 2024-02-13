import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({
    super.key,
    this.appBarHidden = false,
    required this.onPush,
  });

  final bool appBarHidden;
  final Function(TabNavigatorRoutes route) onPush;

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
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              LayoutGrid.doubleModule,
            ),
            child: TextView(
              'Buttons',
              font: fonts.title1,
              textColorNormal: colors.textPrimary.color(),
            ),
          ),
          BaseCellWidget(
            centerCell: TextView('Primary buttons'),
            trailingCell: Icon(
              AdmiralIcons.admiral_ic_chevron_right_outline,
              color: colors.elementSecondary.color(),
            ),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.buttonsPrimary,
            ),
          ),
          BaseCellWidget(
            centerCell: TextView('Secondary buttons'),
            trailingCell: Icon(
              AdmiralIcons.admiral_ic_chevron_right_outline,
              color: colors.elementSecondary.color(),
            ),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.buttonsSecondary,
            ),
          ),
          BaseCellWidget(
            centerCell: TextView('Ghost buttons'),
            trailingCell: Icon(
              AdmiralIcons.admiral_ic_chevron_right_outline,
              color: colors.elementSecondary.color(),
            ),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.buttonsGhost,
            ),
          ),
          BaseCellWidget(
            centerCell: TextView('Rules'),
            trailingCell: Icon(
              AdmiralIcons.admiral_ic_chevron_right_outline,
              color: colors.elementSecondary.color(),
            ),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.buttonsRules,
            ),
          ),
          BaseCellWidget(
            centerCell: TextView('Other buttons'),
            trailingCell: Icon(
              AdmiralIcons.admiral_ic_chevron_right_outline,
              color: colors.elementSecondary.color(),
            ),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.buttonsOther,
            ),
          ),
        ],
      ),
    );
  }
}
