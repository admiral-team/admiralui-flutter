import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class LinkControl extends StatefulWidget {
  /// Creates a LinkControl.
  const LinkControl({
    super.key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.style = LinkStyle.normal,
    this.icon,
    this.iconPosition,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final LinkStyle style;
  final IconData? icon;
  final IconPosition? iconPosition;
  final LinkControlScheme? scheme;

  @override
  State<LinkControl> createState() => _LinkControlState();
}

class _LinkControlState extends State<LinkControl> {
  bool _isPressed = false;
  late LinkControlScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? LinkControlScheme(theme: theme);

    final Color backgroundNormal =
        scheme.linkColor.unsafeParameter(ControlState.normal);
    final Color backgroundHighlighted =
        scheme.linkColor.unsafeParameter(ControlState.highlighted);
    final Color backgroundDisabled =
        scheme.linkColor.unsafeParameter(ControlState.disabled);
    final Color linkColor = widget.isEnable
        ? (_isPressed ? backgroundHighlighted : backgroundNormal)
        : backgroundDisabled;

    List<Widget> childrensWidgets;
    childrensWidgets = <Widget>[];

    if (widget.icon != null && widget.iconPosition == IconPosition.left) {
      childrensWidgets.add(
        Container(
          padding: EdgeInsets.only(right: LayoutGrid.module),
          child: Icon(
            widget.icon,
            color: linkColor,
            size: widget.style == LinkStyle.normal
                ? LayoutGrid.halfModule * 5
                : LayoutGrid.tripleModule,
          ),
        ),
      );
    }

    childrensWidgets.add(
      TextView(
        widget.title,
        font: scheme.linkFont.parameter(widget.style),
        textColorNormal: linkColor,
      ),
    );

    if (widget.icon != null &&
        (widget.iconPosition == IconPosition.right ||
            widget.iconPosition == null)) {
      childrensWidgets.add(
        Container(
          padding: EdgeInsets.only(left: LayoutGrid.module),
          child: Icon(
            widget.icon,
            color: linkColor,
            size: widget.style == LinkStyle.normal
                ? LayoutGrid.halfModule * 5
                : LayoutGrid.tripleModule,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: childrensWidgets,
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
