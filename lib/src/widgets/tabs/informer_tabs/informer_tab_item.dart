import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class InformerTabItemWidget extends StatefulWidget {
  const InformerTabItemWidget(
    this.item,
    this.width, {
    this.isEnabled = true,
    this.isSelected = false,
    this.index = 0,
    this.onTap,
    this.scheme,
    super.key,
  });

  final InformerTabItem item;
  final double width;
  final bool isEnabled;
  final bool isSelected;
  final int index;
  final ValueChanged<int>? onTap;
  final InformerTabItemScheme? scheme;

  @override
  State<StatefulWidget> createState() => _InformerTabItemState();
}

class _InformerTabItemState extends State<InformerTabItemWidget> {
  late InformerTabItemScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InformerTabItemScheme(theme: theme);

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

    final Color subtitleColorNormal =
        scheme.subtitleColor.unsafeParameter(ControlState.normal);
    final Color subtitleColorSelected =
        scheme.subtitleColor.unsafeParameter(ControlState.selected);
    final Color subtitleColorDisabled =
        scheme.subtitleColor.unsafeParameter(ControlState.disabled);
    final Color subtitleColor = widget.isEnabled
        ? (widget.isSelected ? subtitleColorSelected : subtitleColorNormal)
        : subtitleColorDisabled;

    final AFont subtitleFontNormal =
        scheme.subtitleFont.unsafeParameter(ControlState.normal);
    final AFont subtitleFontSelected =
        scheme.subtitleFont.unsafeParameter(ControlState.selected);
    final AFont subtitleFontDisabled =
        scheme.subtitleFont.unsafeParameter(ControlState.disabled);
    final AFont subtitleFont = widget.isEnabled
        ? (widget.isSelected ? subtitleFontSelected : subtitleFontNormal)
        : subtitleFontDisabled;

    final Color borderColorNormal =
        scheme.borderColor.unsafeParameter(ControlState.normal);
    final Color borderColorDisabled =
        scheme.borderColor.unsafeParameter(ControlState.disabled);
    final Color borderColor =
        widget.isEnabled ? borderColorNormal : borderColorDisabled;

    final Color thubmColorNormal =
        scheme.thubmColor.unsafeParameter(ControlState.normal);
    final Color thumbColorDisabled =
        scheme.thubmColor.unsafeParameter(ControlState.disabled);
    final Color thubmColor =
        widget.isEnabled ? thubmColorNormal : thumbColorDisabled;

    final Color itemBorderColor = widget.isSelected ? thubmColor : borderColor;

    return GestureDetector(
      onTap: () => widget.isEnabled ? widget.onTap?.call(widget.index) : null,
      child: Container(
        height: LayoutGrid.halfModule * 20,
        width: widget.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: itemBorderColor,
            width: LayoutGrid.halfModule / 2,
          ),
          borderRadius: BorderRadius.circular(LayoutGrid.module),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextView(
              widget.item.title,
              isEnabled: widget.isEnabled,
              font: titleFont,
              textColorNormal: titleColor,
              textColorDisabled: subtitleColorDisabled,
            ),
            const SizedBox(height: LayoutGrid.module),
            TextView(
              widget.item.subtitle,
              isEnabled: widget.isEnabled,
              font: subtitleFont,
              textColorNormal: subtitleColor,
              textColorDisabled: subtitleColorDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
