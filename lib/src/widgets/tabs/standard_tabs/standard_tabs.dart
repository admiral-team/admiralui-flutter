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
    this.scheme,
    super.key,
  });

  final List<String> tabs;
  final bool isEnabled;
  final List<Widget>? tabBarViews;
  final StandardTabsScheme? scheme;

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
  late StandardTabsScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? StandardTabsScheme(theme: theme);

    final Color textColor =
        widget.isEnabled ? scheme.textColor : scheme.disabledTextColor;
    final Color borderColor =
        widget.isEnabled ? scheme.borderColor : scheme.disabledBorderColor;
    final Color selectedBorderColor = widget.isEnabled
        ? scheme.selectedBorderColor
        : scheme.disabledSelectedBorderColor;
    final TextStyle unselectedLabelStyle =
        scheme.unselectedTextFont.toTextStyle(textColor);
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: DefaultTabController(
        length: widget.tabs.length,
        child: Column(
          children: <Widget>[
            DecoratedBox(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(LayoutGrid.module),
                  side: BorderSide(
                    color: borderColor,
                  ),
                ),
                color: scheme.backgroundColor,
              ),
              child: TabBar(
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    return states.contains(WidgetState.focused)
                        ? null
                        : Colors.transparent;
                  },
                ),
                onTap: (int index) {
                  setState(() {
                    currentPos = index;
                  });
                  widget.onTap?.call(widget.tabs[index]);
                },
                indicator: BoxDecoration(
                  border: Border.all(
                    color: selectedBorderColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    LayoutGrid.module,
                  ),
                ),
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                labelStyle: scheme.textFont.toTextStyle(textColor),
                unselectedLabelStyle: unselectedLabelStyle,
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
      ),
    );
  }
}
