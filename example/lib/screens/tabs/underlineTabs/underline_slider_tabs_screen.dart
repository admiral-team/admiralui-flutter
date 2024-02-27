import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class UnderlineSliderTabsScreen extends StatefulWidget {
  const UnderlineSliderTabsScreen({super.key});

  @override
  State<UnderlineSliderTabsScreen> createState() =>
      _UnderlineSliderTabsScreenState();
}

class _UnderlineSliderTabsScreenState extends State<UnderlineSliderTabsScreen> {
  bool isEnabled = true;

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
          'Underline Slider Tabs',
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
        padding: EdgeInsets.only(bottom: LayoutGrid.doubleModule * 6),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: TitleHeaderWidget(
                title: 'Three controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 3,
            ),
            UnderlineTabs(
              <UnderlineTabItem>[
                UnderlineTabItem('One'),
                UnderlineTabItem('Two'),
                UnderlineTabItem('Three')
              ],
              selectedIndex: 0,
              isEnable: isEnabled,
              horizontalPadding: LayoutGrid.doubleModule,
            ),
            SizedBox(
              height: LayoutGrid.module * 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: TitleHeaderWidget(
                title: 'Slider controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 3,
            ),
            UnderlineTabs(
              <UnderlineTabItem>[
                UnderlineTabItem('One'),
                UnderlineTabItem('Two'),
                UnderlineTabItem('Three'),
                UnderlineTabItem('Four'),
                UnderlineTabItem('Five'),
                UnderlineTabItem('Six'),
                UnderlineTabItem('Seve'),
                UnderlineTabItem('Eight'),
                UnderlineTabItem('Nine'),
              ],
              selectedIndex: 0,
              isEnable: isEnabled,
              horizontalPadding: LayoutGrid.doubleModule,
            ),
            SizedBox(
              height: LayoutGrid.module * 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: LayoutGrid.doubleModule,
              ),
              child: TitleHeaderWidget(
                title: 'Notifications',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 3,
            ),
            UnderlineTabs(
              <UnderlineTabItem>[
                UnderlineTabItem('One', badgeStyle: BadgeStyle.normal),
                UnderlineTabItem('Two', badgeStyle: BadgeStyle.normal),
                UnderlineTabItem('Three', badgeStyle: BadgeStyle.additional),
                UnderlineTabItem('Four'),
                UnderlineTabItem('Five'),
                UnderlineTabItem('Six'),
                UnderlineTabItem('Seve'),
                UnderlineTabItem('Eight'),
                UnderlineTabItem('Nine'),
              ],
              selectedIndex: 0,
              isEnable: isEnabled,
              horizontalPadding: LayoutGrid.doubleModule,
            ),
          ],
        ),
      ),
    );
  }
}
