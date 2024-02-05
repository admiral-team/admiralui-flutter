import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    required this.route,
    required this.svgIconName,
  });

  final String title;
  final String description;
  final TabNavigatorRoutes route;
  final String svgIconName;
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ListCellModel> listItems = <ListCellModel>[
    ListCellModel(
      title: 'Themes',
      description: 'Цветовая схема и шрифтовые стили',
      route: TabNavigatorRoutes.buttons,
      svgIconName: 'assets/svg/pencil.svg',
    ),
    ListCellModel(
      title: 'Icons',
      description: 'Набор иконок',
      route: TabNavigatorRoutes.buttons,
      svgIconName: 'assets/svg/gem.svg',
    ),
    ListCellModel(
      title: 'Buttons',
      description: 'Кнопки',
      route: TabNavigatorRoutes.buttons,
      svgIconName: 'assets/svg/main.svg',
    ),
    ListCellModel(
      title: 'Text fields',
      description: 'Поля ввода',
      route: TabNavigatorRoutes.textfields,
      svgIconName: 'assets/svg/draw.svg',
    ),
    ListCellModel(
      title: 'Cells',
      description: 'Ячейки и списки',
      route: TabNavigatorRoutes.cells,
      svgIconName: 'assets/svg/list.svg',
    ),
    ListCellModel(
      title: 'Text Blocks',
      description: 'Текстовые блоки',
      route: TabNavigatorRoutes.textBlock,
      svgIconName: 'assets/svg/textBlocks.svg',
    ),
    ListCellModel(
      title: 'Tabs',
      description: 'Вкладки',
      route: TabNavigatorRoutes.tabs,
      svgIconName: 'assets/svg/gem.svg',
    ),
    ListCellModel(
      title: 'Informers & Notifications ',
      description: 'Информеры',
      route: TabNavigatorRoutes.toastInformers,
      svgIconName: 'assets/svg/chat.svg',
    ),
    ListCellModel(
      title: 'Tags & Chips',
      description: 'Теги и чипсы',
      route: TabNavigatorRoutes.tags,
      svgIconName: 'assets/svg/pin.svg',
    ),
    ListCellModel(
      title: 'Badges',
      description: 'Количественные зачения',
      route: TabNavigatorRoutes.badges,
      svgIconName: 'assets/svg/badges.svg',
    ),
    ListCellModel(
      title: 'Radiobutton',
      description: 'Радио кнопка',
      route: TabNavigatorRoutes.radioButtons,
      svgIconName: 'assets/svg/radiobuttons.svg',
    ),
    ListCellModel(
      title: 'Checkbox',
      description: 'Селектор',
      route: TabNavigatorRoutes.checkbox,
      svgIconName: 'assets/svg/checkBox.svg',
    ),
    ListCellModel(
      title: 'Switcher',
      description: 'Переключатель',
      route: TabNavigatorRoutes.switcher,
      svgIconName: 'assets/svg/radiobuttons.svg',
    ),
    ListCellModel(
      title: 'Links',
      description: 'Ссылки',
      route: TabNavigatorRoutes.links,
      svgIconName: 'assets/svg/links.svg',
    ),
    ListCellModel(
      title: 'Spinner',
      description: 'Демонстрация процесса загрузки',
      route: TabNavigatorRoutes.spinner,
      svgIconName: 'assets/svg/spinner.svg',
    ),
    ListCellModel(
      title: 'Page Controls',
      description: 'Прогресс просмотра страниц',
      route: TabNavigatorRoutes.pageControls,
      svgIconName: 'assets/svg/pageControlls.svg',
    ),
    ListCellModel(
      title: 'Shimmers',
      description: 'Демонстрация процесса загрузки',
      route: TabNavigatorRoutes.shimmer,
      svgIconName: 'assets/svg/refresh.svg',
    ),
    ListCellModel(
      title: 'Calendar',
      description: 'Календарь',
      route: TabNavigatorRoutes.calendar,
      svgIconName: 'assets/svg/calendar.svg',
    ),
    ListCellModel(
      title: 'Time Picker',
      description: 'Выбор времени',
      route: TabNavigatorRoutes.buttons,
      svgIconName: 'assets/svg/time.svg',
    ),
    ListCellModel(
      title: 'Alerts',
      description: 'Информирующие сообщения',
      route: TabNavigatorRoutes.alerts,
      svgIconName: 'assets/svg/statusHistory.svg',
    ),
    ListCellModel(
      title: 'Tool bar',
      description: 'Меню',
      route: TabNavigatorRoutes.toolbar,
      svgIconName: 'assets/svg/chat.svg',
    ),
    ListCellModel(
      title: 'Bottom-sheet',
      description: 'Информационная панель',
      route: TabNavigatorRoutes.buttons,
      svgIconName: 'assets/svg/bottomSheet.svg',
    ),
    ListCellModel(
      title: 'Currency',
      description: 'Таблица курсов валют',
      route: TabNavigatorRoutes.currency,
      svgIconName: 'assets/svg/currency.svg',
    ),
    ListCellModel(
      title: 'Chat',
      description: 'Элементы чата',
      route: TabNavigatorRoutes.buttons,
      svgIconName: 'assets/svg/chat.svg',
    ),
    ListCellModel(
      title: 'Map Elements',
      description: 'Элементы для карт',
      route: TabNavigatorRoutes.buttons,
      svgIconName: 'assets/svg/chat.svg',
    ),
  ];

  late List<ListCellModel> filterItems = listItems;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: <Widget>[
          _searchBar(colors, fonts),
          Expanded(
            child: Container(
              color: colors.backgroundBasic.color(),
              child: Material(
                color: colors.backgroundBasic.color(),
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: filterItems.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return _buildView(
                      ctx,
                      index,
                      colors,
                      fonts,
                      filterItems,
                    );
                  },
                ),
              ),
            ),
          )
        ],
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
            color: colors.backgroundAdditionalOne.color(),
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            child: SvgPicture.asset(
              item.svgIconName,
              fit: BoxFit.scaleDown,
              height: 10,
              width: 10,
            ),
            width: 10,
            height: 10,
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
            Container(
              child: RichText(
                text: TextSpan(
                    style: fonts.subhead3.toTextStyle(
                      colors.textSecondary.color(),
                    ),
                    text: item.description),
                maxLines: 2,
              ),
            )
          ],
        ),
        trailingCell: Icon(
          AdmiralIcons.admiral_ic_chevron_right_outline,
          color: colors.elementSecondary.color(),
        ),
        onPressed: () {
          widget.onPush.call(item.route);
        },
      );
    }

    return Container();
  }

  Widget _searchBar(ColorPalette colors, FontPalette fonts) {
    return Container(
      color: colors.backgroundBasic.color(),
      padding: EdgeInsets.all(16),
      child: SizedBox(
        height: 36.0,
        child: TextField(
          controller: _searchController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            labelText: 'Поиск',
            hintText: 'Поиск',
            suffixIcon: _searchController.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () => <void>{
                      _searchController.clear(),
                      setState(() {
                        filterItems = listItems;
                      }),
                    },
                    icon: Icon(
                      AdmiralIcons.admiral_ic_small_close_solid,
                      color: colors.backgroundAdditionalTwoPressed.color(),
                    ),
                  ),
            hintStyle: fonts.body2.toTextStyle(
              colors.textSecondary.color(),
            ),
            labelStyle: fonts.body2.toTextStyle(
              colors.textSecondary.color(),
            ),
            isDense: true,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: colors.elementAdditional.color(), width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: colors.elementAdditional.color(), width: 0.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: Icon(
              AdmiralIcons.admiral_ic_search_outline,
              size: 28,
              color: colors.textSecondary.color(),
            ),
            fillColor: colors.elementAdditional.color(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.symmetric(vertical: -10),
          ),
          onChanged: (String newText) => setState(
            () {
              if (newText.isEmpty) {
                filterItems = listItems;
              } else {
                filterItems = listItems
                    .where((ListCellModel item) =>
                        item.title
                            .toLowerCase()
                            .contains(newText.toLowerCase()) ||
                        item.description
                            .toLowerCase()
                            .contains(newText.toLowerCase()))
                    .toList();
              }
            },
          ),
        ),
      ),
    );
  }
}
