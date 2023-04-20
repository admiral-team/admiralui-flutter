import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/controls/control_parameter.dart';
import 'package:admiralui_flutter/src/widgets/controls/tag_control/tag_control_scheme.dart';
import 'package:admiralui_flutter/src/widgets/controls/tag_control/tag_style.dart';
import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:admiralui_flutter/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

/// The Chips and Tags component groups allow users to quickly enter information
/// make selections, filter content, or trigger actions. 
/// A group of such components should be displayed sequentially, 
/// and the content of each component should be short with a clear call to 
/// action, which can be supported by an additional 
/// graphic element (icon) or emoji.
class TagControlWidget extends StatefulWidget {
  const TagControlWidget({
    super.key,
    this.onPressed,
    this.leadingText,
    this.leadingImage,
    this.leadingWidget,
    this.title,
    this.trailingText,
    this.trailingImage,
    this.trailingButtonImage,
    this.trailingButtonWidget,
    this.onTrailingButtonPressed,
    this.style = TagStyle.normal,
    this.isEnabled = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final String? leadingText;
  final IconData? leadingImage;
  final Widget? leadingWidget;
  final String? trailingText;
  final IconData? trailingImage;
  final IconData? trailingButtonImage;
  final Widget? trailingButtonWidget;
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

  /// Constants.
  final double enabledAlpha = 1;
  final double disabledAlpha = 0.5;

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

    List<Widget> childWidgets;
    childWidgets = <Widget>[];

    if (widget.leadingImage != null) {
      childWidgets.add(
        Icon(
          widget.leadingImage,
          color: tintColor,
          size: LayoutGrid.halfModule * 5,
        ),
      );
    } else if (widget.leadingText != null) {
      if (childWidgets.isNotEmpty) {
        childWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childWidgets.add(
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
    } else if (widget.leadingWidget != null) {
      if (childWidgets.isNotEmpty) {
        childWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childWidgets.add(
        Opacity(
          opacity: widget.isEnabled ? enabledAlpha : disabledAlpha,
          child: widget.leadingWidget ?? const SizedBox(),
        ),
      );
    }
    if (widget.title != null) {
      if (childWidgets.isNotEmpty) {
        childWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childWidgets.add(
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
      if (childWidgets.isNotEmpty) {
        childWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childWidgets.add(
        Icon(
          widget.trailingImage,
          color: tintColor,
          size: LayoutGrid.halfModule * 5,
        ),
      );
    } else if (widget.trailingButtonWidget != null) {
      if (childWidgets.isNotEmpty) {
        childWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childWidgets.add(
        Opacity(
          opacity: widget.isEnabled ? enabledAlpha : disabledAlpha,
          child: widget.trailingButtonWidget ?? const SizedBox(),
        ),
      );
    } else if (widget.trailingText != null) {
      if (childWidgets.isNotEmpty) {
        childWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childWidgets.add(
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
    } else if (widget.trailingButtonImage != null) {
      if (childWidgets.isNotEmpty) {
        childWidgets.add(
          const SizedBox(
            width: LayoutGrid.module,
          ),
        );
      }
      childWidgets.add(
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
            vertical: LayoutGrid.halfModule,
            horizontal: LayoutGrid.doubleModule,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: childWidgets,
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
