import 'package:admiralui_flutter/src/widgets/tabs/icon_tabs/icon_tab_item.dart';
import 'package:flutter/material.dart';

class IconTabs extends StatefulWidget {
  const IconTabs(
    this.items, {
    this.isEnabled = true,
    super.key,
  });

  final List<IconTabItem> items;
  final bool isEnabled;

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
