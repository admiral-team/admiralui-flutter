import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/tab.dart';
import 'package:flutter/material.dart';

class StandardTabs extends StatefulWidget {
  const StandardTabs(
    this.tabs, {
    this.isEnabled = true,
    this.tabBarViews,
    this.onTap,
    super.key,
  });

  final List<String> tabs;
  final bool isEnabled;
  final List<Widget>? tabBarViews;

  /// An optional callback that's called when the [TabBar] is tapped.
  ///
  /// The callback is applied to the index of the tab where the tap occurred.
  ///
  /// This callback has no effect on the default handling of taps. It's for
  /// applications that want to do a little extra work when a tab is tapped,
  /// even if the tap doesn't change the TabController's index. TabBar [onTap]
  /// callbacks should not make changes to the TabController since that would
  /// interfere with the default tap handler.
  final ValueChanged<String>? onTap;

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

    final Color textColor = widget.isEnabled
        ? colors.textPrimary.color()
        : colors.textPrimary.colorWithOpacity();
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
                widget.onTap?.call(widget.tabs[index]);
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
              labelStyle: fonts.subhead2.toTextStyle(textColor),
              unselectedLabelStyle: fonts.subhead3.toTextStyle(textColor),
              labelColor: textColor,
              unselectedLabelColor: textColor,
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
