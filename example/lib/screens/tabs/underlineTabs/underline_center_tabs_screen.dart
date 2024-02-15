import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class UnderlineCenterTabsScreen extends StatefulWidget {
  const UnderlineCenterTabsScreen({super.key});

  @override
  State<UnderlineCenterTabsScreen> createState() =>
      _UnderlineCenterTabsScreenState();
}

class _UnderlineCenterTabsScreenState extends State<UnderlineCenterTabsScreen> {
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
          'Underline Center Tabs',
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
                title: 'Two controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 3,
            ),
            UnderlineTabs(
              <String>['One', 'Two'],
              selectedIndex: 0,
              isEnable: isEnabled,
              isCenterTabs: true,
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
              <String>['One', 'Two', 'Three'],
              selectedIndex: 0,
              isEnable: isEnabled,
              isCenterTabs: true,
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
                title: 'Four controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 3,
            ),
            UnderlineTabs(
              <String>['One', 'Two', 'Three', 'Four'],
              selectedIndex: 0,
              isEnable: isEnabled,
              isCenterTabs: true,
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
                title: 'Five controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
            ),
            SizedBox(
              height: LayoutGrid.module * 3,
            ),
            UnderlineTabs(
              <String>['One', 'Two', 'Three', 'Four', 'Five'],
              selectedIndex: 0,
              isEnable: isEnabled,
              isCenterTabs: true,
              horizontalPadding: LayoutGrid.doubleModule,
            ),
          ],
        ),
      ),
    );
  }
}
