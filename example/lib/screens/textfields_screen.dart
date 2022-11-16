import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_cell_model.dart';
import '../navigation/tab_navigator_home.dart';

class TextfieldsScreen extends StatelessWidget {
  const TextfieldsScreen({
    super.key,
    required this.title,
    required this.onPush,
    this.appBarHidden = false,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;
  final bool appBarHidden;

  @override
  Widget build(BuildContext context) {
    final List<ListCellModel> items = <ListCellModel>[
      ListCellModel(
        title: 'Standart',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.feedback),
      ),
      ListCellModel(
        title: 'Double',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.feedback),
      ),
      ListCellModel(
        title: 'Slide',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.feedback),
      ),
      ListCellModel(
        title: 'Number',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.feedback),
      ),
      ListCellModel(
        title: 'Feedback',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.feedback),
      ),
      ListCellModel(
        title: 'Pincode',
        description: '',
        onPressed: () => onPush.call(TabNavigatorRoutes.textfields),
      ),
    ];
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return Scaffold(
      extendBodyBehindAppBar: true,
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
              title: Text(
                title,
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
  }

}
