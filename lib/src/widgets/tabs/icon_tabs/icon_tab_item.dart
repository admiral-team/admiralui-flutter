import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/icon_tabs/icon_tab_item_scheme.dart';
import 'package:admiralui_flutter/src/widgets/tabs/icon_tabs/icon_tabs.dart';
import 'package:flutter/material.dart';

class IconTabItemWidget extends StatefulWidget {
  const IconTabItemWidget({
    super.key,
    required this.item,
    required this.isSelected,
    this.scheme,
  });

  final IconTabItem item;
  final bool isSelected;
  final IconTabItemScheme? scheme;

  @override
  State<StatefulWidget> createState() => _IconTabItemState();
}

class _IconTabItemState extends State<IconTabItemWidget> {
  late IconTabItemScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? IconTabItemScheme(theme: theme);

    final Color circleColordNormal =
        scheme.circleColor.unsafeParameter(ControlState.normal);
    final Color circleColorHighlighted =
        scheme.circleColor.unsafeParameter(ControlState.highlighted);
    final Color circleColor =
        widget.isSelected ? circleColorHighlighted : circleColordNormal;

    final Color titleColorNormal =
        scheme.titleColor.unsafeParameter(ControlState.normal);
    final Color titleColorHighlighted =
        scheme.titleColor.unsafeParameter(ControlState.highlighted);
    final Color titleColor =
        widget.isSelected ? titleColorHighlighted : titleColorNormal;

    final AFont titleFontNormal =
        scheme.titleFont.unsafeParameter(ControlState.normal);
    final AFont titleFontHighlighted =
        scheme.titleFont.unsafeParameter(ControlState.highlighted);
    final AFont titleFont =
        widget.isSelected ? titleFontHighlighted : titleFontNormal;

    final Color iconColorNormal =
        scheme.iconColor.unsafeParameter(ControlState.normal);
    final Color iconColorHighlighted =
        scheme.iconColor.unsafeParameter(ControlState.highlighted);
    final Color iconColor =
        widget.isSelected ? iconColorNormal : iconColorHighlighted;

    return Column(
      children: [
        Container(
          width: LayoutGrid.halfModule * 11,
          height: LayoutGrid.halfModule * 11,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                widget.item.iconData,
                color: iconColor,
              ),
            ],
          ),
        ),
        SizedBox(height: LayoutGrid.module),
        Text(
          widget.item.name,
          style: TextStyle(
            fontSize: titleFont.fontSize,
            color: titleColor,
            fontFamily: titleFont.fontFamily,
            fontWeight: titleFont.fontWeight,
          ),
        ),
      ],
    );
  }
}
