import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class ButtonArrow extends StatefulWidget {
  const ButtonArrow({
    super.key,
    this.onPressed,
    this.title = '',
    this.isEnable = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool isEnable;
  final ButtonArrowWidgetScheme? scheme;

  @override
  State<ButtonArrow> createState() => _ButtonArrowState();
}

class _ButtonArrowState extends State<ButtonArrow> {
  bool _isPressed = false;
  late ButtonArrowWidgetScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ButtonArrowWidgetScheme(theme: theme);

    final Color textColorNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color textColorHighlighted =
        scheme.buttonColor.unsafeParameter(ControlState.highlighted);
    final Color textColorDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color textColor = widget.isEnable
        ? (_isPressed ? textColorHighlighted : textColorNormal)
        : textColorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextView(
            widget.title,
            font: scheme.font,
            textColorNormal: textColor,
          ),
          const SizedBox(
            width: LayoutGrid.halfModule * 3,
          ),
          Icon(
            AdmiralIcons.admiral_ic_chevron_down_outline,
            color: textColor,
          ),
        ],
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
