import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/tab.dart';
import 'package:flutter/material.dart';

class StandardTabs extends StatefulWidget {
  const StandardTabs(
    this.tabs, {
    this.tabBarViews,
    super.key,
  });

  final List<String> tabs;
  final List<Widget>? tabBarViews;

  @override
  State<StatefulWidget> createState() => _StandardTabsState();
}

class _StandardTabsState extends State<StandardTabs>
    with SingleTickerProviderStateMixin {
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final ColorPalette colors = theme.colors;
    final FontPalette fonts = theme.fonts;

    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(LayoutGrid.module),
              ),
              color: colors.backgroundBasic.color(),
            ),
            child: TabBar(
              onTap: (int index) {
                setState(() {
                  currentPos = index;
                });
              },
              indicator: BoxDecoration(
                border: Border.all(
                  color: colors.elementAccent.color(),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  LayoutGrid.module,
                ),
              ),
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              labelStyle: fonts.subhead2.toTextStyle(
                colors.textPrimary.color(),
              ),
              unselectedLabelStyle: fonts.subhead3.toTextStyle(
                colors.textPrimary.color(),
              ),
              labelColor: colors.textPrimary.color(),
              unselectedLabelColor: colors.textPrimary.color(),
              tabs: <Widget>[
                for (int i = 0; i < widget.tabs.length; i++) ...<Widget>[
                  SizedBox(
                    height: LayoutGrid.quadrupleModule,
                    child: AdmiralTab(
                      text: widget.tabs[i],
                      curPosition: i,
                      selected: currentPos,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (widget.tabBarViews?.length == widget.tabs.length)
            Expanded(
              child: SizedBox(
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: widget.tabBarViews ?? <Widget>[],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
