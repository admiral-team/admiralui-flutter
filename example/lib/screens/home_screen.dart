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
        title: 'Themes',
        description: 'Цветовая схема и шрифтовые стили',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Icons',
        description: 'Набор иконок',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Buttons',
        description: 'Кнопки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Text fields',
        description: 'Поля ввода',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.textfields),
      ),
      ListCellModel(
        title: 'Cells',
        description: 'Ячейки и списки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.cells),
      ),
      ListCellModel(
        title: 'Text Blocks',
        description: 'Текстовые блоки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.textBlock),
      ),
      ListCellModel(
        title: 'Tabs',
        description: 'Вкладки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.tabs),
      ),
      ListCellModel(
        title: 'Informers & Notifications ',
        description: 'Информеры',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.informers),
      ),
      ListCellModel(
        title: 'Tags & Chips',
        description: 'Теги и чипсы',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.tags),
      ),
      ListCellModel(
        title: 'Badges',
        description: 'Количественные зачения',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.badges),
      ),
      ListCellModel(
        title: 'Radiobutton',
        description: 'Радио кнопка',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.radioButtons),
      ),
      ListCellModel(
        title: 'Checkbox',
        description: 'Селектор',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.checkbox),
      ),
      ListCellModel(
        title: 'Switcher',
        description: 'Переключатель',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.switcher),
      ),
      ListCellModel(
        title: 'Links',
        description: 'Ссылки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.links),
      ),
      ListCellModel(
        title: 'Spinner',
        description: 'Демонстрация процесса загрузки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.spinner),
      ),
      ListCellModel(
        title: 'Page Controls',
        description: 'Прогресс просмотра страниц',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Shimmers',
        description: 'Демонстрация процесса загрузки',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Calendar',
        description: 'Календарь',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Time Picker',
        description: 'Выбор времени',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Alerts',
        description: 'Информирующие сообщения',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Tool bar',
        description: 'Меню',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Bottom-sheet',
        description: 'Информационная панель',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Currency',
        description: 'Таблица курсов валют',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.currency),
      ),
      ListCellModel(
        title: 'Chat',
        description: 'Элементы чата',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
      ),
      ListCellModel(
        title: 'Map Elements',
        description: 'Элементы для карт',
        onPressed: () => widget.onPush.call(TabNavigatorRoutes.buttons),
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
      body: Container(
        color: colors.backgroundBasic.color(),
        child: Material(
          color: colors.backgroundBasic.color(),
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
