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
    this.leadingText,
    this.leadingImage,
    this.title,
    this.trailingText,
    this.trailingImage,
    this.trailingButtonImage,
    this.onTrailingButtonPressed,
    this.style = TagStyle.normal,
    this.isEnabled = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String? leadingText;
  final IconData? leadingImage;
  final String? trailingText;
  final IconData? trailingImage;
  final IconData? trailingButtonImage;
  final VoidCallback? onTrailingButtonPressed;
  final TagStyle style;
  final String? title;
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
      widget.isEnabled
          ? (_isPressed ? ControlState.normal : ControlState.highlighted)
          : ControlState.disabled,
      widget.style,
    );
    final Color textColor = scheme.textColor.unsafeParameter(
      widget.isEnabled ? ControlState.normal : ControlState.disabled,
    );
    final Color tintColor = scheme.tintColor.unsafeParameter(
      widget.isEnabled ? ControlState.normal : ControlState.disabled,
      widget.style,
    );

    List<Widget> childrensWidgets;
    childrensWidgets = <Widget>[];

    if (widget.leadingImage != null) {
      childrensWidgets.add(
        Icon(
          widget.leadingImage,
          color: tintColor,
          size: LayoutGrid.halfModule * 5,
        ),
      );
    }
    if (widget.leadingText != null) {
      if (childrensWidgets.isNotEmpty) {
        childrensWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childrensWidgets.add(
        Text(
          widget.leadingText ?? '',
          style: TextStyle(
            color: textColor,
            fontSize: scheme.font.fontSize,
            fontFamily: scheme.font.fontFamily,
            fontWeight: scheme.font.fontWeight,
          ),
        ),
      );
    }
    if (widget.title != null) {
      if (childrensWidgets.isNotEmpty) {
        childrensWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childrensWidgets.add(
        Text(
          widget.title ?? '',
          style: TextStyle(
            color: textColor,
            fontSize: scheme.font.fontSize,
            fontFamily: scheme.font.fontFamily,
            fontWeight: scheme.font.fontWeight,
          ),
        ),
      );
    }
    if (widget.trailingImage != null) {
      if (childrensWidgets.isNotEmpty) {
        childrensWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childrensWidgets.add(
        Icon(
          widget.trailingImage,
          color: tintColor,
          size: LayoutGrid.halfModule * 5,
        ),
      );
    }
    if (widget.trailingText != null) {
      if (childrensWidgets.isNotEmpty) {
        childrensWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childrensWidgets.add(
        Text(
          widget.trailingText ?? '',
          style: TextStyle(
            color: textColor,
            fontSize: scheme.font.fontSize,
            fontFamily: scheme.font.fontFamily,
            fontWeight: scheme.font.fontWeight,
          ),
        ),
      );
    }
    if (widget.trailingButtonImage != null) {
      if (childrensWidgets.isNotEmpty) {
        childrensWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childrensWidgets.add(
        InkWell(
          onTap: widget.onTrailingButtonPressed,
          child: Icon(
            widget.trailingButtonImage,
            color: tintColor,
            size: LayoutGrid.halfModule * 5,
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            LayoutGrid.doubleModule,
          ),
        ),
        child: Container(
          height: LayoutGrid.halfModule * 9,
          padding: const EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: childrensWidgets,
          ),
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
