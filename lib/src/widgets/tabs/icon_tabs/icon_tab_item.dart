import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/tabs/icon_tabs/icon_tab_item_scheme.dart';
import 'package:admiralui_flutter/src/widgets/tabs/icon_tabs/icon_tabs.dart';
import 'package:flutter/material.dart';

class IconTabItemWidget extends StatefulWidget {
  const IconTabItemWidget(
    this.item, {
    this.isEnabled = true,
    this.isSelected = false,
    this.scheme,
    super.key,
  });

  final IconTabItem item;
  final bool isEnabled;
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

    final Color circleColorNormal =
        scheme.circleColor.unsafeParameter(ControlState.normal);
    final Color circleColorHighlighted =
        scheme.circleColor.unsafeParameter(ControlState.highlighted);
    final Color circleColorDisabled =
        scheme.circleColor.unsafeParameter(ControlState.highlighted);
    final Color circleColor = widget.isEnabled
        ? (widget.isSelected ? circleColorHighlighted : circleColorNormal)
        : circleColorDisabled;

    final Color titleColorNormal =
        scheme.titleColor.unsafeParameter(ControlState.normal);
    final Color titleColorHighlighted =
        scheme.titleColor.unsafeParameter(ControlState.highlighted);
    final Color titleColorDisabled =
        scheme.titleColor.unsafeParameter(ControlState.disabled);
    final Color titleColor = widget.isEnabled
        ? (widget.isSelected ? titleColorHighlighted : titleColorNormal)
        : titleColorDisabled;

    final AFont titleFontNormal =
        scheme.titleFont.unsafeParameter(ControlState.normal);
    final AFont titleFontHighlighted =
        scheme.titleFont.unsafeParameter(ControlState.highlighted);
    final AFont titleFontDisabled =
        scheme.titleFont.unsafeParameter(ControlState.disabled);
    final AFont titleFont = widget.isEnabled
        ? (widget.isSelected ? titleFontHighlighted : titleFontNormal)
        : titleFontDisabled;

    final Color iconColorNormal =
        scheme.iconColor.unsafeParameter(ControlState.normal);
    final Color iconColorHighlighted =
        scheme.iconColor.unsafeParameter(ControlState.highlighted);
    final Color iconColorDisabled =
        scheme.iconColor.unsafeParameter(ControlState.disabled);
    final Color iconColor = widget.isEnabled
        ? (widget.isSelected ? iconColorNormal : iconColorHighlighted)
        : iconColorDisabled;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: LayoutGrid.halfModule * 11,
          height: LayoutGrid.halfModule * 11,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
          ),
        ),
        Icon(
          widget.item.iconData,
          color: iconColor,
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
