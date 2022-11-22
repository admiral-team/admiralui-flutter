import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/controls/control_parameter.dart';
import 'package:admiralui_flutter/src/widgets/controls/tag_control/tag_control_scheme.dart';
import 'package:admiralui_flutter/src/widgets/controls/tag_control/tag_style.dart';
import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:admiralui_flutter/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

class TagControlWidget extends StatefulWidget {
  const TagControlWidget({
    super.key,
    this.onPressed,
    this.leadingView,
    this.title = '',
    this.trailingView,
    this.style = TagStyle.normal,
    this.isEnabled = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final Widget? leadingView;
  final Widget? trailingView;
  final TagStyle style;
  final String title;
  final double borderRadius = 16.0;
  final bool isEnabled;
  final TagControlScheme? scheme;

  @override
  State<TagControlWidget> createState() => _TagControlWidgetState();
}

class _TagControlWidgetState extends State<TagControlWidget> {
  late TagControlScheme scheme;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TagControlScheme(theme: theme);

    final Color backgroundColor = scheme.backgroundColor.unsafeParameter(
      widget.isEnabled ? 
      (_isPressed ? ControlState.normal : ControlState.highlighted) 
      : ControlState.disabled, 
      widget.style,
    );
    final Color textColor = scheme.textColor.unsafeParameter(
      widget.isEnabled ? ControlState.normal : ControlState.disabled,
    );
    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: Container(
        height: LayoutGrid.halfModule * 9,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 16.0,
        ),
        child: Row(
            children: <Widget>[
              // widget.leadingView ?? Container(),
              // SizedBox(width: LayoutGrid.module),
              Flexible(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: scheme.font.fontSize,
                    fontFamily: scheme.font.fontFamily,
                    fontWeight: scheme.font.fontWeight,
                  ),
                ),
              ),
              // SizedBox(width: LayoutGrid.module),
              // widget.trailingView ?? Container()
            ],
          ),
        ),
      );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
