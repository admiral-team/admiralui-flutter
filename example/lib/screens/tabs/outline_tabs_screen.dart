import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class OutlineTabsScreen extends StatefulWidget {
  const OutlineTabsScreen({super.key});

  @override
  State<OutlineTabsScreen> createState() => _OutlineTabsScreenState();
}

class _OutlineTabsScreenState extends State<OutlineTabsScreen> {
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
          'Outline Slider Tabs',
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
            OutlineTabs(
              <String>['One', 'Two', 'Three'],
              isEnabled: isEnabled,
              horizontalPadding: LayoutGrid.doubleModule,
              onSelected: (int index) {},
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
              height: LayoutGrid.halfModule * 5,
            ),
            OutlineTabs(
              <String>[
                'One',
                'Two',
                'Three',
                'Four',
                'Five',
                'Six',
                'Seven',
                'Eight',
                'Nine',
                'Ten'
              ],
              isEnabled: isEnabled,
              horizontalPadding: LayoutGrid.doubleModule,
              onSelected: (int index) {},
            ),
          ],
        ),
      ),
    );
  }
}
