import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/underline_tabs/undeline_tabs_scheme.dart';
import 'package:flutter/material.dart';

class UnderlineTabs extends StatefulWidget {
  const UnderlineTabs(
    this.items, {
    this.isEnable = true,
    this.selectedIndex,
    this.onTap,
    this.isCenterTabs = false,
    this.horizontalPadding = 0.0,
    this.scheme,
    super.key,
  });

  final List<String> items;
  final bool isEnable;
  final int? selectedIndex;
  final ValueChanged<int>? onTap;
  final bool isCenterTabs;
  final double horizontalPadding;
  final UnderlineTabsScheme? scheme;

  @override
  State<StatefulWidget> createState() => _UnderlineTabsState();
}

class _UnderlineTabsState extends State<UnderlineTabs>
    with SingleTickerProviderStateMixin {
  late UnderlineTabsScheme scheme;
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? UnderlineTabsScheme(theme: theme);

    final Color borderColorNormal =
        scheme.borderColor.unsafeParameter(ControlState.normal);
    final Color backgroundDisabled =
        scheme.borderColor.unsafeParameter(ControlState.disabled);
    final Color borderColor =
        widget.isEnable ? borderColorNormal : backgroundDisabled;

    final Color textColorNormal =
        scheme.labelColor.unsafeParameter(ControlState.normal);
    final Color textColorDisabled =
        scheme.labelColor.unsafeParameter(ControlState.disabled);
    final Color textColor =
        widget.isEnable ? textColorNormal : textColorDisabled;

    final AFont textFont = widget.isEnable
        ? scheme.labelFont.unsafeParameter(ControlState.normal)
        : scheme.labelFont.unsafeParameter(ControlState.disabled);

    return DefaultTabController(
      length: widget.items.length,
      initialIndex: widget.selectedIndex ?? 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        child: Column(
          children: <Widget>[
            IgnorePointer(
              ignoring: !widget.isEnable,
              child: TabBar(
                tabAlignment: widget.isCenterTabs ? null : TabAlignment.start,
                isScrollable: !widget.isCenterTabs,
                dividerColor: Colors.transparent,
                onTap: (int index) {
                  setState(() {
                    currentPos = index;
                    widget.onTap?.call(index);
                  });
                },
                labelPadding: const EdgeInsets.only(bottom: LayoutGrid.module),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: borderColor,
                    width: LayoutGrid.halfModule / 2,
                  ),
                ),
                padding: EdgeInsets.zero,
                tabs: <Widget>[
                  for (int i = 0; i < widget.items.length; i++) ...<Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.isCenterTabs ? 0 : LayoutGrid.module,
                      ),
                      child: Center(
                        child: Text(
                          widget.items[i],
                          style: TextStyle(
                            fontSize: textFont.fontSize,
                            color: textColor,
                            fontFamily: textFont.fontFamily,
                            fontWeight: textFont.fontWeight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
