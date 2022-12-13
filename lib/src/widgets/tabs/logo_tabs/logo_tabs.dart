import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/logo_tabs/logo_tabs_scheme.dart';
import 'package:admiralui_flutter/src/widgets/tabs/tab.dart';
import 'package:flutter/material.dart';

class LogoTabs extends StatefulWidget {
  const LogoTabs(
    this.images, {
    this.isEnabled = true,
    this.onSelected,
    this.scheme,
    super.key,
  });

  final List<Widget> images;
  final bool isEnabled;
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

    final Color borderColorNormal =
        scheme.borderColor.unsafeParameter(ControlState.normal);
    final Color borderColorDisabled =
        scheme.borderColor.unsafeParameter(ControlState.disabled);
    // ignore: lines_longer_than_80_chars
    final Color borderColor =
        widget.isEnabled ? borderColorNormal : borderColorDisabled;

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
              color: borderColor,
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
