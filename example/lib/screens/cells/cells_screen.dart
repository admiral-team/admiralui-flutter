import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class CellsScreen extends StatelessWidget {
  const CellsScreen({
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
              'Cells',
              font: fonts.title1,
              textColorNormal: colors.textPrimary.color(),
            ),
          ),
          BaseCellWidget(
            centerCell: TitleCellWidget(title: 'Base Cells'),
            trailingCell: const ArrowCellWidget(),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.baseCells,
            ),
          ),
          BaseCellWidget(
            centerCell: TitleCellWidget(title: 'Actionbar'),
            trailingCell: const ArrowCellWidget(),
            onPressed: () => onPush.call(
              TabNavigatorRoutes.actionCells,
            ),
          ),
        ],
      ),
    );
  }
}
