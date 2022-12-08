import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/underline_tabs/undeline_tabs_scheme.dart';
import 'package:flutter/material.dart';

class UnderlineTabs extends StatefulWidget {
  const UnderlineTabs(
    this.items, {
    this.isEnable = true,
    this.onTap,
    this.tabBarViews,
    this.scheme,
    super.key,
  });

  final List<String> items;
  final bool isEnable;
  final ValueChanged<String>? onTap;
  final List<Widget>? tabBarViews;
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
    final Color textColordDisabled =
        scheme.labelColor.unsafeParameter(ControlState.disabled);
    final Color textColor =
        widget.isEnable ? textColorNormal : textColordDisabled;

    final AFont textFont = widget.isEnable
        ? scheme.labelFont.unsafeParameter(ControlState.normal)
        : scheme.labelFont.unsafeParameter(ControlState.disabled);

    return DefaultTabController(
      length: widget.items.length,
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: scheme.backgroundColor,
            ),
            child: TabBar(
              onTap: (int index) {
                setState(() {
                  currentPos = index;
                  widget.onTap?.call(widget.items[index]);
                });
              },
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: borderColor,
                  width: LayoutGrid.halfModule / 2,
                ),
              ),
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              tabs: <Widget>[
                for (int i = 0; i < widget.items.length; i++) ...<Widget>[
                  Text(
                    widget.items[i],
                    style: TextStyle(
                      fontSize: textFont.fontSize,
                      color: textColor,
                      fontFamily: textFont.fontFamily,
                      fontWeight: textFont.fontWeight,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (widget.tabBarViews?.length == widget.items.length)
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
