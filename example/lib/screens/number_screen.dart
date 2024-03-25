import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'list_cell_model.dart';
import '../navigation/tab_navigator_home.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  Widget build(BuildContext context) {
    final List<ListCellModel> items = <ListCellModel>[
      ListCellModel(
        title: 'Default',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.inputNumberDefault),
      ),
      ListCellModel(
        title: 'Secondary',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.inputNumberSecondary),
      ),
      ListCellModel(
        title: 'Input',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.inputNumberTextfield),
      ),
    ];
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(LayoutGrid.doubleModule),
            child: TextView(
              title,
              font: fonts.title1,
              textColorNormal: colors.textPrimary.color(),
            ),
          ),
          Expanded(
            child: ListView.separated(
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: items.length,
              itemBuilder: (BuildContext ctx, int index) {
                final ListCellModel? item =
                    index == items.length ? null : items[index];
                if (item is ListCellModel) {
                  return BaseCellWidget(
                    centerCell: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          item.title,
                          style: fonts.body1.toTextStyle(
                            colors.textPrimary.color(),
                          ),
                        ),
                      ],
                    ),
                    trailingCell: Icon(
                      AdmiralIcons.admiral_ic_chevron_right_outline,
                      color: colors.elementSecondary.color(),
                    ),
                    onPressed: item.onPressed,
                  );
                }
                return Container();
              },
              separatorBuilder: (
                BuildContext ctx,
                int index,
              ) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
