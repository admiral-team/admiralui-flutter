import 'dart:convert';
import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:example/storage/app_theme_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../navigation/tab_navigator_info.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorInfoRoutes route) onPush;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
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

class _InfoScreenState extends State<InfoScreen> {
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();
  String version = '';

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.toggleButton();
    loadVersion();
  }

  @override
  void dispose() {
    super.dispose();
    appThemeButtonStorage.toggleButton();
  }

  Future<void> loadVersion() async {
    final String response = await rootBundle.loadString('assets/version.json');
    final Map<String, dynamic> data = await json.decode(response);
    setState(() {
      version = data['external_version'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    final List<ListCellModel> items = <ListCellModel>[
      ListCellModel(
        title: 'Инфо',
        description: '',
        icon: Icon(
          AdmiralIcons.admiral_ic_info_solid,
          color: colors.elementAccent.color(),
        ),
        onPressed: () {
          widget.onPush.call(TabNavigatorInfoRoutes.description);
        },
      ),
      ListCellModel(
        title: 'Контакты',
        description: '',
        icon: Icon(
          AdmiralIcons.admiral_ic_email_solid,
          color: colors.elementAccent.color(),
        ),
        onPressed: () {
          widget.onPush.call(TabNavigatorInfoRoutes.contacts);
        },
      ),
      ListCellModel(
        title: 'FAQ',
        description: '',
        icon: Icon(
          AdmiralIcons.admiral_ic_help_solid,
          color: colors.elementAccent.color(),
        ),
        onPressed: () {},
      ),
      ListCellModel(
        title: 'Документация',
        description: '',
        icon: Icon(
          AdmiralIcons.admiral_ic_docs_solid,
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
              SizedBox(
                width: LayoutGrid.halfModule * 35,
                height: LayoutGrid.halfModule * 35,
                child: Assets.info.appLogo.image(),
              ),
              Text(
                'Версия: $version',
                style: fonts.body1.toTextStyle(
                  colors.textSecondary.color(),
                ),
              ),
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
