import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// Enum representing the possible states of a text input field.
///
/// - `normal`: The default state of the text input field.
/// - `error`: Indicates an error state in the text input field.
/// - `disabled`: Represents a disabled state for the text input field.
/// - `readOnly`: Indicates that the text input field is in read-only mode.
///
/// This enum is often used to control the appearance and behavior of a text
/// input widget based on its state.
/// ```

enum TextInputState { normal, error, disabled, readOnly }

/// This widget provides a customizable text input field
/// with additional features
///
/// Constructor:
/// ```
/// TextFieldWidget(
///   TextEditingController controller, {
///   TextInputState state = TextInputState.normal,
///   FocusNode? focusNode,
///   TextInputType? keyboardType,
///   TextInputAction? textInputAction,
///   String labelText = '',
///   String? informerText,
///   String placeHolderText = '',
///   int? numberOfLines = 1,
///   bool? hasSecure,
///   Icon? trailingIcon,
///   Widget? bottomWidget,
///   ValueChanged<String>? onChanged,
///   VoidCallback? onEditingComplete,
///   VoidCallback? onTrailingTap,
///   TextFieldScheme? scheme,
///   Key? key,
/// })
/// ```
///
/// Parameters:
/// - `controller`: A controller for the text field.
/// - `state`: The state of the text input field
///   (normal, error, disabled, readOnly).
/// - `focusNode`: An optional focus node for the text input.
/// - `keyboardType`: An optional keyboard type for the text input.
/// - `textInputAction`: An optional text input action for the text input.
/// - `labelText`: The label text for the text input.
/// - `informerText`: Additional informative text.
/// - `placeHolderText`: Placeholder text for the text input.
/// - `numberOfLines`: The number of lines for the text input.
/// - `hasSecure`: A boolean indicating if the text input is secure (password).
/// - `trailingIcon`: An optional trailing icon for the text input.
/// - `bottomWidget`: An optional widget to display below the text input.
/// - `onChanged`: Callback function when the text input value changes.
/// - `onEditingComplete`: Callback function when editing is complete.
/// - `onTrailingTap`: Callback function when the trailing icon is tapped.
/// - `scheme`: An optional scheme defining the appearance of the text input.
/// - `key`: An optional key to uniquely identify this widget.
///
/// Example usage:
///
/// TextFieldWidget(
///   myTextEditingController,
///   labelText: 'Username',
///   state: TextInputState.normal,
///   onChanged: (text) {
///     // Handle text changes
///   },
/// )
/// ```

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
    this.controller, {
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.labelText = '',
    this.informerText,
    this.placeHolderText = '',
    this.numberOfLines = 1,
    this.hasSecure,
    this.trailingIcon,
    this.bottomWidget,
    this.onTrailingTap,
    this.onChanged,
    this.onEditingComplete,
    this.scheme,
    super.key,
  });

  final TextEditingController controller;
  final TextInputState state;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String labelText;
  final String? informerText;
  final String placeHolderText;
  final int? numberOfLines;
  final bool? hasSecure;
  final Icon? trailingIcon;
  final Widget? bottomWidget;

  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTrailingTap;
  final TextFieldScheme? scheme;

  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldWidget>
    with SingleTickerProviderStateMixin {
  FocusNode? _focusNode;
  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());
  bool _hasFocus = false;
  bool _isSecure = false;

  String get _textFieldText => widget.controller.text;
  String get _labelText => widget.labelText;
  String get _placeHolderText =>
      _isTextFieldActive && widget.placeHolderText.isNotEmpty
          ? widget.placeHolderText
          : '';

  bool get _isTextFieldActive => _hasFocus || _textFieldText.isNotEmpty;
  bool get _isLabelVisible => widget.labelText.isNotEmpty;

  late TextFieldScheme scheme;

  @override
  void initState() {
    super.initState();

    _isSecure = widget.hasSecure ?? false;
    _effectiveFocusNode
        .addListener(() => _onFocus(hasFocus: _effectiveFocusNode.hasFocus));
  }

  @override
  void dispose() {
    super.dispose();
    _effectiveFocusNode.removeListener(() {});
    _focusNode?.dispose();
  }

  void _onFocus({required bool hasFocus}) {
    if (!mounted) {
      return;
    }
    setState(() {
      _hasFocus = hasFocus;
    });
  }

  void _onChanged({required String text}) {
    setState(() {});
    widget.onChanged?.call(text);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TextFieldScheme(theme: theme);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(
                        height: LayoutGrid.doubleModule,
                      ),
                      TextField(
                        maxLines: widget.numberOfLines,
                        obscureText: _isSecure,
                        controller: widget.controller,
                        focusNode: _effectiveFocusNode,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: scheme.textFieldFont.fontWeight,
                          fontFamily: scheme.textFieldFont.fontFamily,
                          fontSize: scheme.textFieldFont.fontSize,
                          color: scheme.textColor.unsafeParameter(widget.state),
                        ),
                        keyboardType: widget.keyboardType,
                        decoration: InputDecoration(
                          hintText: _placeHolderText,
                          border: InputBorder.none,
                          isDense: true,
                          hintStyle: TextStyle(
                            fontWeight: scheme.placeholderFont.fontWeight,
                            fontFamily: scheme.placeholderFont.fontFamily,
                            fontStyle: FontStyle.normal,
                            fontSize: scheme.placeholderFont.fontSize,
                            color: scheme.placeholderColor,
                          ),
                        ),
                        onChanged: (String text) => _onChanged(text: text),
                        enabled: widget.state != TextInputState.disabled,
                        readOnly: widget.state == TextInputState.readOnly,
                      ),
                    ],
                  ),
                  if (_isLabelVisible)
                    TextFieldAnimatedLabel(
                      widget.state,
                      _effectiveFocusNode,
                      _labelText,
                      isTextFieldActive: _isTextFieldActive,
                      hasFocus: _hasFocus,
                    ),
                ],
              ),
            ),
            if (widget.hasSecure == true)
              AbsorbPointer(
                absorbing: widget.state == TextInputState.disabled,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSecure = !_isSecure;
                    });
                  },
                  child: SizedBox(
                    height: LayoutGrid.quadrupleModule,
                    width: LayoutGrid.quadrupleModule,
                    child: _isSecure
                        ? Icon(
                            AdmiralIcons.admiral_ic_eye_outline,
                            color:
                                scheme.iconColor.unsafeParameter(widget.state),
                          )
                        : Icon(
                            AdmiralIcons.admiral_ic_eye_close_outline,
                            color:
                                scheme.iconColor.unsafeParameter(widget.state),
                          ),
                  ),
                ),
              ),
            if (widget.trailingIcon != null)
              AbsorbPointer(
                absorbing: widget.state == TextInputState.disabled,
                child: GestureDetector(
                  onTap: () {
                    widget.onTrailingTap?.call();
                  },
                  child: SizedBox(
                    height: LayoutGrid.quadrupleModule,
                    width: LayoutGrid.quadrupleModule,
                    child: Icon(
                      widget.trailingIcon?.icon,
                      color: scheme.iconColor.unsafeParameter(widget.state),
                    ),
                  ),
                ),
              ),
          ],
        ),
        TextFieldSeparator(
          widget.state,
          isEditing: _hasFocus,
        ),
        if (widget.bottomWidget != null)
          const SizedBox(height: LayoutGrid.module),
        Container(child: widget.bottomWidget),
        const SizedBox(height: LayoutGrid.module),
        if (widget.informerText != null &&
            widget.informerText?.isEmpty == false)
          TextView(
            widget.informerText!,
            font: scheme.informerFont,
            textColorNormal:
                scheme.infomerLabelColor.unsafeParameter(widget.state),
          ),
      ],
    );
  }
}
