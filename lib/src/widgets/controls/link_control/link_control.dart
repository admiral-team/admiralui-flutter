import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A LinkControl.
///
// LinkControl is used for navigation, can be applied separately or inside
// the text, with or without an icon, usually complements other components.
//
// The component is presented in two style (LinkStyle):
// normal (24px) and medium (16px), and two states: Default and Disabled.
// The width of the component depends on the content.
class LinkControl extends StatefulWidget {
  /// Creates a LinkControl.
  const LinkControl({
    super.key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.style = LinkStyle.normal,
    this.leadingImage,
    this.trailingImage,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final LinkStyle style;
  final IconData? leadingImage;
  final IconData? trailingImage;
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

    List<Widget> childrenWidgets;
    childrenWidgets = <Widget>[];

    if (widget.leadingImage != null) {
      childrenWidgets.add(
        Container(
          padding: const EdgeInsets.only(
            right: LayoutGrid.module,
          ),
          child: Icon(
            widget.leadingImage,
            color: linkColor,
            size: widget.style == LinkStyle.normal
                ? LayoutGrid.halfModule * 5
                : LayoutGrid.tripleModule,
          ),
        ),
      );
    }

    childrenWidgets.add(
      Expanded(
        child: TextView(
          widget.title,
          font: scheme.linkFont.parameter(widget.style),
          textColorNormal: linkColor,
        ),
      ),
    );

    if (widget.trailingImage != null) {
      childrenWidgets.add(
        Container(
          padding: const EdgeInsets.only(left: LayoutGrid.module),
          child: Icon(
            widget.trailingImage,
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
        children: childrenWidgets,
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
