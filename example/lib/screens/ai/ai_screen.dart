import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/storage/app_theme_storage.dart';
import 'package:flutter/material.dart';

import '../../navigation/tab_navigation_ai.dart';

class AIScreen extends StatefulWidget {
  const AIScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorAIRoutes route) onPush;

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class ListCellModel {
  ListCellModel({
    required this.title,
    required this.description,
    this.icon,
    required this.onPressed,
  });

  final String title;
  final String description;
  final Icon? icon;
  final VoidCallback onPressed;
}

class _AIScreenState extends State<AIScreen> {
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();
  String version = '';

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.setThemeButtonHidden(false);
  }


  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final List<ListCellModel> items = <ListCellModel>[
      ListCellModel(
        title: 'Local templates',
        description: '',
        icon: Icon(
          AdmiralIcons.admiral_ic_info_solid,
          color: colors.elementAccent.color(),
        ),
        onPressed: () => widget.onPush.call(
          TabNavigatorAIRoutes.localTemplates
        ),
      ),
      ListCellModel(
        title: 'Remote templates',
        description: '',
        icon: Icon(
          AdmiralIcons.admiral_ic_info_solid,
          color: colors.elementAccent.color(),
        ),
        onPressed: () => 
        widget.onPush.call(TabNavigatorAIRoutes.remoteTemplates),
      ),
      ListCellModel(
        title: 'AI Generation',
        description: '',
        icon: Icon(
          AdmiralIcons.admiral_ic_email_solid,
          color: colors.elementAccent.color(),
        ),
        onPressed: () {},
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: LayoutGrid.quadrupleModule * 3,
        backgroundColor: colors.backgroundBasic.color(),
        title: Row(
          children: <Widget>[
            Text(
              widget.title,
              style: fonts.title1.toTextStyle(
                colors.textPrimary.color(),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: colors.backgroundBasic.color(),
        child: Material(
          color: colors.backgroundBasic.color(),
          child: Column(
            children: <Widget>[
              const SizedBox(height: LayoutGrid.doubleModule * 3),
              Expanded(
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
                    return Container();
                  },
                ),
              ),
            ],
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
        leadingCell: item.icon,
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
