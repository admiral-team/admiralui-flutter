import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

import '../navigation/tab_navigator_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class ListCellModel {
  ListCellModel({
    required this.title,
    required this.description,
    required this.onPressed,
  });

  final String title;
  final String description;
  final VoidCallback onPressed;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ListCellModel> items = <ListCellModel>[
      ListCellModel(
        title: 'Buttons',
        description: 'Кнопки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Badges',
        description: 'Количественные зачения',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.badges),
      ),
    ];

    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: LayoutGrid.module * 10,
        backgroundColor: colors.backgroundBasic.color(),
        title: Text(
          widget.title,
          style: fonts.largeTitle1.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
      ),
      body: ColoredBox(
        color: colors.backgroundBasic.color(),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: LayoutGrid.doubleModule,
          ),
          child: ListView.separated(
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext ctx, int index) {
              return _buildView(
                ctx,
                index,
                colors,
                fonts,
                items,
              );
            },
            separatorBuilder: (
              BuildContext ctx,
              int index,
            ) {
              return SizedBox(
                height: LayoutGrid.doubleModule,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildView(
    BuildContext ctx,
    int index,
    ColorPalette colors,
    FontPalette fonts,
    List<ListCellModel> items,
  ) {
    final ListCellModel? item = index == items.length ? null : items[index];

    if (item is ListCellModel) {
      return BaseCellWidget(
        leadingCell: Container(
          width: LayoutGrid.module * 6,
          height: LayoutGrid.module * 6,
          decoration: BoxDecoration(
            color: colors.textPrimary.color(),
            shape: BoxShape.circle,
          ),
        ),
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
            Text(
              item.description,
              style: fonts.subhead3.toTextStyle(
                colors.textSecondary.color(),
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
  }
}
