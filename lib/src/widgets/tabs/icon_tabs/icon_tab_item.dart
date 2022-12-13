import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A IconTabItemWidget.
// The tab view that contains text and circle view with icon in the center.
// The width of the component depends on the content.

class IconTabItemWidget extends StatefulWidget {
  /// Creates a IconTabItemWidget.
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
    final Color circleColorSelected =
        scheme.circleColor.unsafeParameter(ControlState.selected);
    final Color circleColorDisabled =
        scheme.circleColor.unsafeParameter(ControlState.disabled);
    final Color circleColor = widget.isEnabled
        ? (widget.isSelected ? circleColorSelected : circleColorNormal)
        : circleColorDisabled;

    final Color titleColorNormal =
        scheme.titleColor.unsafeParameter(ControlState.normal);
    final Color titleColorSelected =
        scheme.titleColor.unsafeParameter(ControlState.selected);
    final Color titleColorDisabled =
        scheme.titleColor.unsafeParameter(ControlState.disabled);
    final Color titleColor = widget.isEnabled
        ? (widget.isSelected ? titleColorSelected : titleColorNormal)
        : titleColorDisabled;

    final AFont titleFontNormal =
        scheme.titleFont.unsafeParameter(ControlState.normal);
    final AFont titleFontSelected =
        scheme.titleFont.unsafeParameter(ControlState.selected);
    final AFont titleFontDisabled =
        scheme.titleFont.unsafeParameter(ControlState.disabled);
    final AFont titleFont = widget.isEnabled
        ? (widget.isSelected ? titleFontSelected : titleFontNormal)
        : titleFontDisabled;

    final Color iconColorNormal =
        scheme.iconColor.unsafeParameter(ControlState.normal);
    final Color iconColorSelected =
        scheme.iconColor.unsafeParameter(ControlState.selected);
    final Color iconColorDisabled =
        scheme.iconColor.unsafeParameter(ControlState.disabled);
    final Color iconColor = widget.isEnabled
        ? (widget.isSelected ? iconColorNormal : iconColorSelected)
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
          child: Icon(
            widget.item.iconData,
            color: iconColor,
          ),
        ),
        const SizedBox(height: LayoutGrid.module),
        TextView(
          widget.item.name,
          isEnabled: widget.isEnabled,
          font: titleFont,
          textColorNormal: titleColor,
          textColorDisabled: titleColorDisabled,
        ),
      ],
    );
  }
}
