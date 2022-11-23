import 'dart:ffi';

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/logo_tabs/logo_tabs_scheme.dart';
import 'package:admiralui_flutter/src/widgets/tabs/tab.dart';
import 'package:flutter/material.dart';

class LogoTabs extends StatefulWidget {
  const LogoTabs({
    super.key,
    required this.images,
    this.onSelected,
    this.scheme,
  });

  final List<Widget> images;
  final void Function(int index)? onSelected;
  final LogoTabsScheme? scheme;

  @override
  State<StatefulWidget> createState() => _LogoTabsState();
}

class _LogoTabsState extends State<LogoTabs>
    with SingleTickerProviderStateMixin {
  late LogoTabsScheme scheme;
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? LogoTabsScheme(theme: theme);

    return DefaultTabController(
      length: widget.images.length,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutGrid.module),
          ),
          color: scheme.backgroundColor,
        ),
        child: TabBar(
          onTap: (int index) {
            setState(() {
              currentPos = index;
              if (widget.onSelected != null) {
                setState(() {
                  widget.onSelected!(currentPos);
                });
              }
            });
          },
          indicator: BoxDecoration(
            border: Border.all(
              color: scheme.borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(
              LayoutGrid.module,
            ),
          ),
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          labelStyle: scheme.labelFont.toTextStyle(
            scheme.labelColor,
          ),
          unselectedLabelStyle: scheme.unselectedLabelFont.toTextStyle(
            scheme.labelColor,
          ),
          labelColor: scheme.labelColor,
          unselectedLabelColor: scheme.labelColor,
          tabs: <Widget>[
            for (int i = 0; i < widget.images.length; i++) ...<Widget>[
              SizedBox(
                height: LayoutGrid.quadrupleModule,
                child: AdmiralTab(
                  icon: widget.images[i],
                  curPosition: i,
                  selected: currentPos,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
