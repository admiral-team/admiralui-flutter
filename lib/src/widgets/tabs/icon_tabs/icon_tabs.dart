import 'package:admiralui_flutter/src/widgets/tabs/icon_tabs/icon_tab_item.dart';
import 'package:flutter/material.dart';

/// A IconTabs.
// A horizontal control that consists of multiple segments,
// each segment functioning as image with text.
// The component is used to switch between tabs. It is presented in
// two versions without additional indentation.
// The width of the component depends on the content.

class IconTabs extends StatefulWidget {
  /// Creates a IconTabs.
  const IconTabs(
    this.items, {
    this.isEnabled = true,
    this.selectedIndex,
    this.onTap,
    super.key,
  });

  final List<IconTabItem> items;
  final bool isEnabled;
  final int? selectedIndex;
  final ValueChanged<int>? onTap;

  @override
  State<StatefulWidget> createState() => _IconTabsState();
}

class IconTabItem {
  IconTabItem(this.name, this.iconData);
  String name;
  IconData iconData;
}

class _IconTabsState extends State<IconTabs>
    with SingleTickerProviderStateMixin {
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.items.length,
      initialIndex: widget.selectedIndex ?? 0,
      child: SizedBox(
        child: Column(
          children: <Widget>[
            DecoratedBox(
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(),
              ),
              child: TabBar(
                onTap: (int index) {
                  setState(() {
                    currentPos = index;
                    widget.onTap?.call(index);
                  });
                },
                indicatorColor: Colors.transparent,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                tabs: <Widget>[
                  for (int i = 0; i < widget.items.length; i++) ...<Widget>[
                    IconTabItemWidget(
                      widget.items[i],
                      isEnabled: widget.isEnabled,
                      isSelected: currentPos == i,
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
