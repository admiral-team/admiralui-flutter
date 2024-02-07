import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class BaseCellsScreen extends StatelessWidget {
  const BaseCellsScreen({
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
              'Base Cells',
              font: fonts.title1,
              textColorNormal: colors.textPrimary.color(),
            ),
          ),
          BaseCellWidget(
            centerCell: TitleCellWidget(title: 'Leading elements'),
            trailingCell: const ArrowCellWidget(),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.leadingCell,
            ),
          ),
          BaseCellWidget(
            centerCell: TitleCellWidget(title: 'Center elements'),
            trailingCell: const ArrowCellWidget(),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.centerCells,
            ),
          ),
          BaseCellWidget(
            centerCell: TitleCellWidget(title: 'Trailing elements'),
            trailingCell: const ArrowCellWidget(),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.trailingCells,
            ),
          ),
        ],
      ),
    );
  }
}
