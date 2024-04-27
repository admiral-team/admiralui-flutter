// ignore_for_file: avoid_print

import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A compound widget consisting of two text fields and a double slider.
///
/// This widget allows the user to input a numeric range using two text fields
/// and a slider. It provides real-time validation of input values and updates
/// the slider accordingly.
///
/// Constructor:
/// ```
/// DoubleSliderTextField({
///   Key? key,
///   required TextEditingController textControllerLeading,
///   required TextEditingController textControllerTrailing,
///   TextInputState state = TextInputState.normal,
///   FocusNode? focusNode,
///   TextInputType? keyboardType,
///   TextInputAction? textInputAction,
///   String labelText = '',
///   String trailingText = '',
///   String? informerText,
///   String placeholderFrom = '',
///   String placeholderTo = '',
///   double minValue = 0,
///   double maxValue = 100,
///   int divisions = 100,
///   RangeValues? currentRangeValues,
///   ValueChanged<RangeValues>? onChanged,
///   InputRangeTextFieldScheme? scheme,
/// })
/// ```
///
/// Parameters:
/// - `textControllerLeading`: The TextEditingController
/// for the leading text field.
/// - `textControllerTrailing`: The TextEditingController
/// for the trailing text field.
/// - `state`: The state of the text fields, one of [TextInputState.normal],
///   [TextInputState.disabled], or [TextInputState.readOnly].
/// Defaults to [TextInputState.normal].
/// - `focusNode`: An optional FocusNode to control the
/// focus behavior of the text fields.
/// - `keyboardType`: The keyboard type for the text fields.
/// Defaults to [TextInputType.number].
/// - `textInputAction`: The input action for the text fields.
/// - `labelText`: The label text for the entire widget.
/// - `trailingText`: The trailing text for the text fields.
/// - `informerText`: Additional information text to be
/// displayed below the widget.
/// - `placeholderFrom`: The placeholder text for the leading text field.
/// - `placeholderTo`: The placeholder text for the trailing text field.
/// - `minValue`: The minimum value for the numeric range. Defaults to 0.
/// - `maxValue`: The maximum value for the numeric range. Defaults to 100.
/// - `divisions`: The number of divisions for the double slider.
/// Defaults to 100.
/// - `currentRangeValues`: The initial range values for the double slider.
/// - `onChanged`: A callback function called when the slider values change.
/// - `scheme`: An optional `InputRangeTextFieldScheme` object that defines
///   the color scheme for the text fields and slider.
///
/// Example usage:
/// ```dart
/// DoubleSliderTextField(
///   textControllerLeading: TextEditingController(),
///   textControllerTrailing: TextEditingController(),
///   state: TextInputState.normal,
///   focusNode: FocusNode(),
///   keyboardType: TextInputType.number,
///   textInputAction: TextInputAction.done,
///   labelText: 'Optional label',
///   trailingText: '₽',
///   informerText: 'Select a numeric range.',
///   placeholderFrom: 'Min Placeholder',
///   placeholderTo: 'Max Placeholder',
///   minValue: 0,
///   maxValue: 100,
///   divisions: 100,
///   currentRangeValues: RangeValues(20, 80),
///   onChanged: (RangeValues values) {
///     // Handle range values change
///   },
/// )
/// ```
class DoubleSliderTextField extends StatefulWidget {
  const DoubleSliderTextField({
    super.key,
    this.leadingTextFieldKey,
    this.trailingTextFieldKey,
    required this.textControllerLeading,
    required this.textControllerTrailing,
    this.state = TextInputState.normal,
    this.focusNode,
    this.keyboardType = TextInputType.number,
    this.textInputAction,
    this.labelText = '',
    this.trailingText = '',
    this.informerText,
    this.placeholderFrom = '',
    this.placeholderTo = '',
    this.minValue = 0,
    this.maxValue = 100,
    this.divisions = 100,
    this.currentRangeValues,
    this.onChanged,
    this.scheme,
  });

  final TextEditingController textControllerLeading;
  final TextEditingController textControllerTrailing;
  final TextInputState state;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String labelText;
  final String trailingText;
  final String? informerText;
  final String placeholderFrom;
  final String placeholderTo;
  final double minValue;
  final double maxValue;
  final int divisions;
  final RangeValues? currentRangeValues;
  final ValueChanged<RangeValues>? onChanged;
  final InputRangeTextFieldScheme? scheme;
  final Key? leadingTextFieldKey;
  final Key? trailingTextFieldKey;

  @override
  _DoubleSliderTextFieldState createState() => _DoubleSliderTextFieldState();
}

class _DoubleSliderTextFieldState extends State<DoubleSliderTextField>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late RangeValues _currentRangeValues;
  late InputRangeTextFieldScheme scheme;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _currentRangeValues = widget.currentRangeValues ??
        RangeValues(widget.minValue, widget.maxValue);
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(() {});
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? InputRangeTextFieldScheme(theme: theme);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildLabelText(),
        const SizedBox(width: LayoutGrid.module),
        _buildTextFieldsRow(),
        const SizedBox(height: LayoutGrid.halfModule * 3),
        _buildDoubleSliderWidget(),
        const SizedBox(height: LayoutGrid.module),
        _buildMinAndMaxValuesRow(),
        const SizedBox(height: LayoutGrid.halfModule * 3),
        if (widget.informerText != null &&
            widget.informerText?.isNotEmpty == true)
          _buildInformerText(),
      ],
    );
  }

  Widget _buildLabelText() {
    return TextView(
      widget.labelText,
      font: scheme.labelFont,
      textColorNormal: scheme.labelTextColor.unsafeParameter(widget.state),
    );
  }

  Widget _buildTextFieldsRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildLeadingTextField(),
        const Spacer(),
        _buildTrailingTextField(),
      ],
    );
  }

  Widget _buildLeadingTextField() {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: LayoutGrid.halfModule / 2,
          ),
          child: TextView(
            'от',
            font: scheme.fromToTextFont,
            textColorNormal:
                scheme.valueTextColor.unsafeParameter(widget.state),
          ),
        ),
        const SizedBox(width: LayoutGrid.halfModule),
        IntrinsicWidth(
          child: TextField(
            key: widget.leadingTextFieldKey,
            controller: widget.textControllerLeading,
            focusNode: _focusNode,
            textAlign: TextAlign.left,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d+\.?\d*'),
              ),
            ],
            style: TextStyle(
              fontWeight: scheme.textFieldScheme.textFieldFont.fontWeight,
              fontFamily: scheme.textFieldScheme.textFieldFont.fontFamily,
              fontSize: scheme.textFieldScheme.textFieldFont.fontSize,
              color: scheme.textColor.unsafeParameter(widget.state),
            ),
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            decoration: InputDecoration(
              hintText: widget.textControllerLeading.text.isEmpty
                  ? widget.placeholderFrom
                  : '',
              border: InputBorder.none,
              isDense: true,
              hintStyle: TextStyle(
                fontWeight: scheme.textFieldScheme.placeholderFont.fontWeight,
                fontFamily: scheme.textFieldScheme.placeholderFont.fontFamily,
                fontStyle: FontStyle.normal,
                fontSize: scheme.textFieldScheme.placeholderFont.fontSize,
                color: scheme.textFieldScheme.placeholderColor,
              ),
            ),
            onSubmitted: (String text) {
              _updateCurrentRangeValues(text, true);
            },
            enabled: widget.state != TextInputState.disabled,
            readOnly: widget.state == TextInputState.readOnly,
          ),
        ),
        if (widget.textControllerLeading.text.isNotEmpty)
          Container(
            padding: const EdgeInsets.only(
              top: LayoutGrid.halfModule / 2,
            ),
            child: TextView(
              widget.trailingText,
              font: scheme.leadingTextFont,
              textColorNormal:
                  scheme.leadingTextColor.unsafeParameter(widget.state),
              textColorDisabled:
                  scheme.leadingTextColor.unsafeParameter(widget.state),
            ),
          ),
      ],
    );
  }

  Widget _buildTrailingTextField() {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: LayoutGrid.halfModule / 2,
          ),
          child: TextView(
            'до',
            font: scheme.fromToTextFont,
            textColorNormal:
                scheme.valueTextColor.unsafeParameter(widget.state),
          ),
        ),
        const SizedBox(width: LayoutGrid.halfModule),
        IntrinsicWidth(
          child: TextField(
            key: widget.trailingTextFieldKey,
            controller: widget.textControllerTrailing,
            textAlign: TextAlign.left,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(
                RegExp(r'^\d+\.?\d*'),
              ),
            ],
            style: TextStyle(
              fontWeight: scheme.textFieldScheme.textFieldFont.fontWeight,
              fontFamily: scheme.textFieldScheme.textFieldFont.fontFamily,
              fontSize: scheme.textFieldScheme.textFieldFont.fontSize,
              color: scheme.textColor.unsafeParameter(widget.state),
            ),
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            decoration: InputDecoration(
              hintText: widget.textControllerTrailing.text.isEmpty
                  ? widget.placeholderTo
                  : '',
              border: InputBorder.none,
              isDense: true,
              hintStyle: TextStyle(
                fontWeight: scheme.textFieldScheme.placeholderFont.fontWeight,
                fontFamily: scheme.textFieldScheme.placeholderFont.fontFamily,
                fontStyle: FontStyle.normal,
                fontSize: scheme.textFieldScheme.placeholderFont.fontSize,
                color: scheme.textFieldScheme.placeholderColor,
              ),
            ),
            onSubmitted: (String text) {
              _updateCurrentRangeValues(text, false);
            },
            enabled: widget.state != TextInputState.disabled,
            readOnly: widget.state == TextInputState.readOnly,
          ),
        ),
        if (widget.textControllerTrailing.text.isNotEmpty)
          Container(
            padding: const EdgeInsets.only(
              top: LayoutGrid.halfModule / 2,
            ),
            child: TextView(
              widget.trailingText,
              font: scheme.leadingTextFont,
              textColorNormal:
                  scheme.leadingTextColor.unsafeParameter(widget.state),
              textColorDisabled:
                  scheme.leadingTextColor.unsafeParameter(widget.state),
            ),
          ),
      ],
    );
  }

  void _updateCurrentRangeValues(String text, bool isLeading) {
    try {
      final double currentTextValue =
          text.isNotEmpty ? double.parse(text) : 0.0;

      double start = _currentRangeValues.start;
      double end = _currentRangeValues.end;

      if (isLeading) {
        if (currentTextValue >= widget.minValue && currentTextValue <= end) {
          start = currentTextValue;
        } else if (currentTextValue > end) {
          start = end;
          widget.textControllerLeading.text = '${end.toInt()}';
        } else if (currentTextValue < widget.minValue) {
          start = widget.minValue;
          widget.textControllerLeading.text = '${widget.minValue.toInt()}';
        }
      } else {
        if (currentTextValue >= start && currentTextValue <= widget.maxValue) {
          end = currentTextValue;
        } else if (currentTextValue > widget.maxValue) {
          end = widget.maxValue;
          widget.textControllerTrailing.text = '${widget.maxValue.toInt()}';
        } else if (currentTextValue < start) {
          end = start;
          widget.textControllerTrailing.text = '${start.toInt()}';
        }
      }

      setState(() {
        _currentRangeValues = RangeValues(start, end);
      });

      widget.onChanged?.call(_currentRangeValues);
    } catch (e) {
      print('Invalid input string $text');
    }
  }

  Widget _buildDoubleSliderWidget() {
    return DoubleSliderWidget(
      isEnabled: widget.state != TextInputState.disabled,
      min: widget.minValue,
      max: widget.maxValue,
      divisions: widget.divisions,
      currentRangeValues: _currentRangeValues,
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
          widget.textControllerLeading.text = '${values.start.toInt()}';
          widget.textControllerTrailing.text = '${values.end.toInt()}';
        });
        widget.onChanged?.call(_currentRangeValues);
      },
    );
  }

  Widget _buildMinAndMaxValuesRow() {
    return Row(
      children: <Widget>[
        TextView(
          widget.minValue.toInt().toString(),
          font: scheme.valueFont,
          textColorNormal: scheme.valueTextColor.unsafeParameter(widget.state),
        ),
        const Spacer(),
        TextView(
          widget.maxValue.toInt().toString(),
          font: scheme.valueFont,
          textColorNormal: scheme.valueTextColor.unsafeParameter(widget.state),
        ),
      ],
    );
  }

  Widget _buildInformerText() {
    return TextView(
      widget.informerText!,
      font: scheme.textFieldScheme.informerFont,
      textColorNormal: scheme.textFieldScheme.infomerLabelColor
          .unsafeParameter(widget.state),
    );
  }
}
