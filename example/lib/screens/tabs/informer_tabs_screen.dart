import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/cupertino.dart';
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
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: colors.elementSecondary.color(),
          ),
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
                            TextView(
                              'до 1 500 000 ₽',
                              font: theme.fonts.largeTitle1,
                              textColorNormal: theme.colors.textAccent.color(),
                              textColorDisabled:
                                  theme.colors.textAccent.colorWithOpacity(),
                              textAlign: TextAlign.center,
                              isEnabled: isEnabled,
                            ),
                            SizedBox(
                              width: LayoutGrid.doubleModule,
                            ),
                            Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                color:
                                    theme.colors.textAccentAdditional.color(),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: LayoutGrid.module,
                        ),
                        TextView(
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
                            TextView(
                              'до 1 500 000 ₽',
                              font: theme.fonts.largeTitle1,
                              textColorNormal: theme.colors.textAccent.color(),
                              textColorDisabled:
                                  theme.colors.textAccent.colorWithOpacity(),
                              textAlign: TextAlign.center,
                              isEnabled: isEnabled,
                            ),
                            SizedBox(
                              width: LayoutGrid.doubleModule,
                            ),
                            Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                color:
                                    theme.colors.textAccentAdditional.color(),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: LayoutGrid.module,
                        ),
                        TextView(
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
