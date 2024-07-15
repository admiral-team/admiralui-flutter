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

  @override
  void initState() {
    super.initState();
    appThemeButtonStorage.toggleButton();
  }

  @override
  void dispose() {
    super.dispose();
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
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: AdmiralIconsFlutterList.iconNames.length,
                itemBuilder: (BuildContext context, int index) {
                  final String iconName =
                      AdmiralIconsFlutterList.iconNames[index];
                  return Icon(
                    AdmiralIconsFlutterList.iconDataMap[iconName],
                    size: 28,
                    color: colors.elementAccent.color(),
                  );
                },
              ),
            ),
          ],
        ),
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
                        // filterItems = listItems;
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
              } else {}
            },
          ),
        ),
      ),
    );
  }
}
