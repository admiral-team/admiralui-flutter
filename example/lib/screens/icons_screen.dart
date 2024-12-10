import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../storage/app_theme_storage.dart';

class IconsScreen extends StatefulWidget {
  const IconsScreen({super.key});

  @override
  State<IconsScreen> createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final AppThemeStorage appThemeButtonStorage = AppThemeStorage();
  String? _informerText;
  Offset? _informerPosition;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.toggleButton();

    _scrollController.addListener(() {
      if (_scrollController.position.isScrollingNotifier.value) {
        setState(() {
          _informerText = null;
          _informerPosition = null;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    appThemeButtonStorage.toggleButton();
  }

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
        title: Text(
          'Icons',
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: LayoutGrid.doubleModule),
            child: Column(
              children: <Widget>[
                _searchBar(colors, fonts),
                SizedBox(
                  height: LayoutGrid.tripleModule,
                ),
                StandardTabs(
                  <String>['Outline', 'Solid'],
                  onTap: (String value) {
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: LayoutGrid.tripleModule,
                ),
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: LayoutGrid.module,
                      mainAxisSpacing: LayoutGrid.module,
                    ),
                    itemCount: AdmiralIconsFlutterList.iconNames.length,
                    itemBuilder: (BuildContext context, int index) {
                      final String rawIconName =
                          AdmiralIconsFlutterList.iconNames[index];
                      final String formattedIconName = rawIconName
                          .replaceAll('_outline', '')
                          .replaceAll('_solid', '')
                          .split('_')
                          .map((String part) => part.isNotEmpty
                              ? part[0].toUpperCase() + part.substring(1)
                              : '')
                          .join('_');

                      return GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          setState(() {
                            _informerText = formattedIconName;
                            _informerPosition = details.globalPosition;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              AdmiralIconsFlutterList.iconDataMap[rawIconName],
                              size: LayoutGrid.halfModule * 7,
                              color: colors.elementAccent.color(),
                            ),
                            TextView(
                              formattedIconName,
                              font: fonts.caption1,
                              textColorNormal: colors.textSecondary.color(),
                              maxLines: 1,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_informerText != null && _informerPosition != null)
            Builder(
              builder: (BuildContext context) {
                final SmallInformerScheme smallInformerScheme =
                    SmallInformerScheme(theme: theme);
                final TextPainter textPainter = TextPainter(
                  text: TextSpan(
                    text: _informerText,
                    style: TextStyle(
                      fontSize: smallInformerScheme.font.fontSize,
                      fontWeight: smallInformerScheme.font.fontWeight,
                      color: smallInformerScheme.enabledTextColor,
                    ),
                  ),
                  textDirection: TextDirection.ltr,
                )..layout(maxWidth: LayoutGrid.doubleModule * 18);

                final double textWidth = textPainter.size.width;

                final double screenWidth = MediaQuery.of(context).size.width;
                final double xPosition = _informerPosition!.dx;
                final double yPosition = _informerPosition!.dy;

                final bool isNearRightEdge =
                    xPosition + LayoutGrid.doubleModule * 18 / 2 > screenWidth;

                return Positioned(
                  left: _informerPosition!.dx -
                      (isNearRightEdge ? textWidth : LayoutGrid.halfModule * 5),
                  top: yPosition - LayoutGrid.doubleModule * 6,
                  child: SmallInformerWidget(
                    title: _informerText,
                    arrowDirectionStyle: isNearRightEdge
                        ? InformerDirectionStyle.topRight
                        : InformerDirectionStyle.topLeft,
                    style: InformerStyle.normal,
                    isEnable: true,
                  ),
                );
              },
            )
        ],
      ),
    );
  }

  Widget _searchBar(ColorPalette colors, FontPalette fonts) {
    return Container(
      color: colors.backgroundBasic.color(),
      child: SizedBox(
        height: 36.0,
        child: TextFormField(
          key: const Key('mainSearchBar'),
          controller: _searchController,
          textAlign: TextAlign.left,
          style: TextStyle(color: colors.textPrimary.color()),
          decoration: InputDecoration(
            labelText: 'Поиск',
            hintText: 'Поиск',
            suffixIcon: _searchController.text.isEmpty
                ? null
                : IconButton(
                    onPressed: () => <void>{
                      _searchController.clear(),
                      setState(() {
                        // Добавить фильтрацию
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
                // Добавить фильтрацию
              } else {}
            },
          ),
        ),
      ),
    );
  }
}
