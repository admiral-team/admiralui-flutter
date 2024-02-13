import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import '../../navigation/tab_navigator_home.dart';

class InformerTabsScreen extends StatefulWidget {
  const InformerTabsScreen({
    super.key,
    required this.title,
    required this.onPush,
  });

  final String title;
  final Function(TabNavigatorRoutes route) onPush;

  State<InformerTabsScreen> createState() => _InformerTabsScreenState();
}

class _InformerTabsScreenState extends State<InformerTabsScreen> {
  bool isEnabled = true;
  bool isLoading = false;
  FocusNode focusNode = FocusNode();
  TextInputState state = TextInputState.normal;
  TextEditingController textController = TextEditingController();
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;
    screenWidth = MediaQuery.of(context).size.width;
    print('device width - $screenWidth');
    return Scaffold(
      backgroundColor: colors.backgroundBasic.color(),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.title,
          style: fonts.subtitle2.toTextStyle(
            colors.textPrimary.color(),
          ),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: colors.backgroundBasic.color(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: LayoutGrid.doubleModule * 4),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: StandardTabs(
                <String>['Default', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    isEnabled = value == 'Default';
                  });
                },
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 5,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Two controls',
                  font: theme.fonts.headline,
                  textColorNormal: theme.colors.textSecondary.color(),
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            InformerTabs(
              <InformerTabItem>[
                InformerTabItem('2 900 ₽', 'в месяц'),
                InformerTabItem('2 900 ₽', 'в месяц'),
              ],
              isEnabled: isEnabled,
              paddingHorizontal: LayoutGrid.doubleModule,
              customView: Container(
                color: isEnabled
                    ? theme.colors.backgroundAdditionalOne.color()
                    : theme.colors.backgroundAdditionalOne.colorWithOpacity(),
                width: screenWidth,
                child: Center(
                  child: SizedBox(
                    width: 290.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: LayoutGrid.module * 3,
                        ),
                        TextView(
                          'то получу в страховом случае',
                          font: theme.fonts.headline,
                          textColorNormal: theme.colors.textPrimary.color(),
                          textColorDisabled:
                              theme.colors.textPrimary.colorWithOpacity(),
                          textAlign: TextAlign.center,
                          isEnabled: isEnabled,
                        ),
                        SizedBox(
                          height: LayoutGrid.halfModule,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextView(
                                'до 1 500 000₽',
                                font: theme.fonts.largeTitle1,
                                textColorNormal:
                                    theme.colors.textAccent.color(),
                                textColorDisabled:
                                    theme.colors.textAccent.colorWithOpacity(),
                                textAlign: TextAlign.left,
                                isEnabled: isEnabled,
                              ),
                            ),
                            SizedBox(
                              width: LayoutGrid.doubleModule,
                            ),
                            Icon(
                              AdmiralIcons.admiral_ic_help_outline,
                              size: LayoutGrid.halfModule * 7,
                              color: theme.colors.elementPrimary.color(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: LayoutGrid.module,
                        ),
                        TextView(
                          // ignore: lines_longer_than_80_chars
                          'Выгодный вариант для  двухкомнатной квартиры или дачного дома',
                          font: theme.fonts.subhead4,
                          textColorNormal: theme.colors.textPrimary.color(),
                          textColorDisabled:
                              theme.colors.textPrimary.colorWithOpacity(),
                          isEnabled: isEnabled,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: LayoutGrid.doubleModule,
                ),
                TextView(
                  'Three controls',
                  font: theme.fonts.headline,
                  textColorNormal: theme.colors.textSecondary.color(),
                ),
              ],
            ),
            SizedBox(height: LayoutGrid.doubleModule),
            InformerTabs(
              <InformerTabItem>[
                InformerTabItem('2 900 ₽', 'в месяц'),
                InformerTabItem('2 900 ₽', 'в месяц'),
                InformerTabItem('2 900 ₽', 'в месяц'),
              ],
              isEnabled: isEnabled,
              paddingHorizontal: LayoutGrid.doubleModule,
              customView: Container(
                color: isEnabled
                    ? theme.colors.backgroundAdditionalOne.color()
                    : theme.colors.backgroundAdditionalOne.colorWithOpacity(),
                width: screenWidth,
                child: Center(
                  child: SizedBox(
                    width: 290.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: LayoutGrid.module * 3,
                        ),
                        TextView(
                          'то получу в страховом случае',
                          font: theme.fonts.headline,
                          textColorNormal: theme.colors.textPrimary.color(),
                          textColorDisabled:
                              theme.colors.textPrimary.colorWithOpacity(),
                          textAlign: TextAlign.center,
                          isEnabled: isEnabled,
                        ),
                        SizedBox(
                          height: LayoutGrid.halfModule,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextView(
                                'до 1 500 000₽',
                                font: theme.fonts.largeTitle1,
                                textColorNormal:
                                    theme.colors.textAccent.color(),
                                textColorDisabled:
                                    theme.colors.textAccent.colorWithOpacity(),
                                textAlign: TextAlign.left,
                                isEnabled: isEnabled,
                              ),
                            ),
                            SizedBox(
                              width: LayoutGrid.doubleModule,
                            ),
                            Icon(
                              AdmiralIcons.admiral_ic_help_outline,
                              size: LayoutGrid.halfModule * 7,
                              color: theme.colors.elementPrimary.color(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: LayoutGrid.module,
                        ),
                        TextView(
                          // ignore: lines_longer_than_80_chars
                          'Выгодный вариант для  двухкомнатной квартиры или дачного дома',
                          font: theme.fonts.subhead4,
                          textColorNormal: theme.colors.textPrimary.color(),
                          textColorDisabled:
                              theme.colors.textPrimary.colorWithOpacity(),
                          isEnabled: isEnabled,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 38,
            ),
          ],
        ),
      ),
    );
  }
}
