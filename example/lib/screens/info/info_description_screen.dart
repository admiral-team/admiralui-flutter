import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:example/storage/app_theme_storage.dart';
import 'package:flutter/material.dart';

import '../../navigation/tab_navigator_info.dart';

class InfoDescriptionScreen extends StatefulWidget {
  const InfoDescriptionScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorInfoRoutes route) onPush;

  @override
  State<InfoDescriptionScreen> createState() => _InfoDescriptionScreenState();
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

class _InfoDescriptionScreenState extends State<InfoDescriptionScreen> {
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextView(
                widget.title,
                font: fonts.title1,
                textColorNormal: colors.textPrimary.color(),
              ),
              const SizedBox(height: LayoutGrid.doubleModule),
              ParagrapgWidget(
                title:
                    // ignore: lines_longer_than_80_chars
                    'Данное приложение служит удобным интументом для всех участников команд.',
              ),
              ParagrapgWidget(
                title:
                    // ignore: lines_longer_than_80_chars
                    'Есть возможность протестировать все компоненты общебанковской мобильной дизайн-системы в живую взаимодействуя с ними.',
              ),
              ParagrapgWidget(
                title:
                    // ignore: lines_longer_than_80_chars
                    'Кроме состояний и работы компонентов вы сможете увидеть уже готовые темы, а также создать собственную.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
