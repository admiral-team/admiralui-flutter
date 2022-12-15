import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class TextFieldAnimatedLabel extends StatefulWidget {
  const TextFieldAnimatedLabel(
    this.state,
    this.focusNode,
    this.labelText, {
    this.isTextFieldActive = false,
    this.hasFocus = false,
    this.scheme,
    super.key,
  });

  final TextInputState state;
  final FocusNode focusNode;
  final String labelText;
  final bool isTextFieldActive;
  final bool hasFocus;
  final TextFieldAnimatedLabelScheme? scheme;

  @override
  State<StatefulWidget> createState() => _TextFieldAnimatedLabelState();
}

class _TextFieldAnimatedLabelState extends State<TextFieldAnimatedLabel> {
  late TextFieldAnimatedLabelScheme scheme;

  final double _topInset = LayoutGrid.module * 3;
  final Duration _animationDuration = const Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TextFieldAnimatedLabelScheme(theme: theme);

    final AFont labelFont = widget.isTextFieldActive
        ? scheme.focusedLabelFont
        : scheme.unfocucedLabelFont;
    final bool isEnabled = widget.state != TextInputState.disabled;
    Color labelTextColor;

    switch (widget.state) {
      case TextInputState.normal:
        labelTextColor = (widget.hasFocus && isEnabled)
            ? scheme.textColor.unsafeParameter(TextInputState.normal)
            : scheme.textColor.unsafeParameter(TextInputState.readOnly);
        break;
      default:
        labelTextColor = scheme.textColor.unsafeParameter(widget.state);
    }

    return Positioned.fill(
      child: IgnorePointer(
        ignoring: widget.isTextFieldActive,
        child: GestureDetector(
          onTap: () {
            if (!widget.isTextFieldActive) {
              widget.focusNode.requestFocus();
            }
          },
          child: Column(
            children: <Widget>[
              AnimatedSize(
                curve: Curves.easeInOut,
                duration: _animationDuration,
                child:
                    SizedBox(height: widget.isTextFieldActive ? 0 : _topInset),
              ),
              Row(
                children: <Widget>[
                  AnimatedDefaultTextStyle(
                    curve: Curves.easeInOut,
                    duration: _animationDuration,
                    style: TextStyle(
                      fontSize: labelFont.fontSize,
                      color: labelTextColor,
                      fontFamily: labelFont.fontFamily,
                      fontWeight: labelFont.fontWeight,
                    ),
                    child: Text(
                      widget.labelText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: labelFont.fontSize,
                        color: labelTextColor,
                        fontFamily: labelFont.fontFamily,
                        fontWeight: labelFont.fontWeight,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
