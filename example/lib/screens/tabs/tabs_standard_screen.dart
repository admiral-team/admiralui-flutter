import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class TabStandardScreen extends StatefulWidget {
  const TabStandardScreen({
    super.key,
    this.appBarHidden = false,
  });

  final bool appBarHidden;

  @override
  State<TabStandardScreen> createState() => _TabStandardScreenState();
}

class _TabStandardScreenState extends State<TabStandardScreen> {
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
          'Standard Tabs',
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
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutGrid.doubleModule,
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: LayoutGrid.doubleModule * 6),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StandardTabs(
                <String>['Default', 'Disabled'],
                onTap: (String value) {
                  setState(() {
                    isEnabled = value == 'Default';
                  });
                },
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                title: 'Two controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.module * 3,
              ),
              StandardTabs(
                <String>['One', 'Two'],
                isEnabled: isEnabled,
                onTap: (String _) {},
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                title: 'Three controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              StandardTabs(
                <String>['One', 'Two', 'Three'],
                isEnabled: isEnabled,
                onTap: (String _) {},
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                title: 'Four controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              StandardTabs(
                <String>['One', 'Two', 'Three', 'Four'],
                isEnabled: isEnabled,
                onTap: (String _) {},
              ),
              SizedBox(
                height: LayoutGrid.module * 5,
              ),
              TitleHeaderWidget(
                title: 'Five controls',
                style: TitleHeaderStyle.headlineSecondary,
                textAlign: TextAlign.left,
                isEnable: isEnabled,
              ),
              SizedBox(
                height: LayoutGrid.halfModule * 5,
              ),
              StandardTabs(
                <String>['One', 'Two', 'Three', 'Four', 'Five'],
                isEnabled: isEnabled,
                onTap: (String _) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
