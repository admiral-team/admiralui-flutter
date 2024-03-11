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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextView(
                    widget.labelText,
                    font: scheme.labelFont,
                    textColorNormal:
                        scheme.labelTextColor.unsafeParameter(widget.state),
                  ),
                  const SizedBox(
                    width: LayoutGrid.module,
                  ),
                  Row(
                    children: <Widget>[
                      TextView(
                        widget.textControllerLeading.text.isNotEmpty
                            ? 'от'
                            : '',
                        font: scheme.fromToTextFont,
                        textColorNormal:
                            scheme.valueTextColor.unsafeParameter(widget.state),
                      ),
                      SizedBox(
                        width: widget.textControllerLeading.text.isNotEmpty
                            ? LayoutGrid.halfModule
                            : 0,
                      ),
                      IntrinsicWidth(
                        child: TextField(
                          controller: widget.textControllerLeading,
                          focusNode: _focusNode,
                          textAlign: TextAlign.left,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d*'),
                            ),
                          ],
                          style: TextStyle(
                            fontWeight:
                                scheme.textFieldScheme.textFieldFont.fontWeight,
                            fontFamily:
                                scheme.textFieldScheme.textFieldFont.fontFamily,
                            fontSize:
                                scheme.textFieldScheme.textFieldFont.fontSize,
                            color:
                                scheme.textColor.unsafeParameter(widget.state),
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
                              fontWeight: scheme
                                  .textFieldScheme.placeholderFont.fontWeight,
                              fontFamily: scheme
                                  .textFieldScheme.placeholderFont.fontFamily,
                              fontStyle: FontStyle.normal,
                              fontSize: scheme
                                  .textFieldScheme.placeholderFont.fontSize,
                              color: scheme.textFieldScheme.placeholderColor,
                            ),
                          ),
                          onSubmitted: (String text) {
                            try {
                              if (text.isNotEmpty) {
                                final double currentTextValue =
                                    double.parse(text);
                                if (currentTextValue >= widget.minValue &&
                                    currentTextValue <=
                                        _currentRangeValues.end) {
                                  setState(() {
                                    _currentRangeValues = RangeValues(
                                      currentTextValue,
                                      _currentRangeValues.end,
                                    );
                                  });

                                  widget.textControllerLeading.text = text;
                                  widget.onChanged?.call(_currentRangeValues);
                                } else if (currentTextValue >
                                    _currentRangeValues.end) {
                                  setState(() {
                                    _currentRangeValues = RangeValues(
                                      _currentRangeValues.end,
                                      _currentRangeValues.end,
                                    );
                                    widget.textControllerLeading.text =
                                        '${_currentRangeValues.end.toInt()}';
                                  });
                                } else if (currentTextValue < widget.minValue) {
                                  setState(() {
                                    _currentRangeValues = RangeValues(
                                      widget.minValue,
                                      _currentRangeValues.end,
                                    );
                                    widget.textControllerLeading.text =
                                        '${widget.minValue.toInt()}';
                                  });
                                }
                              } else {
                                setState(() {
                                  _currentRangeValues = RangeValues(
                                    0,
                                    _currentRangeValues.end,
                                  );
                                  widget.textControllerLeading.text = '';
                                });
                              }
                            } catch (e) {
                              print('Invalid input string $text');
                            }
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
                            textColorNormal: scheme.leadingTextColor
                                .unsafeParameter(widget.state),
                            textColorDisabled: scheme.leadingTextColor
                                .unsafeParameter(widget.state),
                          ),
                        ),
                      const Spacer(),
                      TextView(
                        widget.textControllerTrailing.text.isNotEmpty
                            ? 'до'
                            : '',
                        font: scheme.fromToTextFont,
                        textColorNormal:
                            scheme.valueTextColor.unsafeParameter(widget.state),
                      ),
                      SizedBox(
                        width: widget.textControllerTrailing.text.isNotEmpty
                            ? LayoutGrid.halfModule
                            : 0,
                      ),
                      IntrinsicWidth(
                        child: TextField(
                          controller: widget.textControllerTrailing,
                          textAlign: TextAlign.left,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d*'),
                            ),
                          ],
                          style: TextStyle(
                            fontWeight:
                                scheme.textFieldScheme.textFieldFont.fontWeight,
                            fontFamily:
                                scheme.textFieldScheme.textFieldFont.fontFamily,
                            fontSize:
                                scheme.textFieldScheme.textFieldFont.fontSize,
                            color:
                                scheme.textColor.unsafeParameter(widget.state),
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
                              fontWeight: scheme
                                  .textFieldScheme.placeholderFont.fontWeight,
                              fontFamily: scheme
                                  .textFieldScheme.placeholderFont.fontFamily,
                              fontStyle: FontStyle.normal,
                              fontSize: scheme
                                  .textFieldScheme.placeholderFont.fontSize,
                              color: scheme.textFieldScheme.placeholderColor,
                            ),
                          ),
                          onSubmitted: (String text) {
                            try {
                              if (text.isNotEmpty) {
                                final double currentTextValue =
                                    double.parse(text);
                                if (currentTextValue >=
                                        _currentRangeValues.start &&
                                    currentTextValue <= widget.maxValue) {
                                  setState(() {
                                    _currentRangeValues = RangeValues(
                                      _currentRangeValues.start,
                                      currentTextValue,
                                    );
                                  });

                                  widget.textControllerTrailing.text = text;
                                  widget.onChanged?.call(_currentRangeValues);
                                } else if (currentTextValue > widget.maxValue) {
                                  setState(() {
                                    _currentRangeValues = RangeValues(
                                      _currentRangeValues.start,
                                      widget.maxValue,
                                    );
                                    widget.textControllerTrailing.text =
                                        '${widget.maxValue.toInt()}';
                                  });
                                } else if (currentTextValue <
                                    _currentRangeValues.start) {
                                  setState(() {
                                    _currentRangeValues = RangeValues(
                                      _currentRangeValues.start,
                                      _currentRangeValues.start,
                                    );
                                    widget.textControllerTrailing.text =
                                        '${_currentRangeValues.start.toInt()}';
                                  });
                                }
                              } else {
                                setState(() {
                                  _currentRangeValues = RangeValues(
                                    _currentRangeValues.start,
                                    widget.maxValue,
                                  );
                                  widget.textControllerTrailing.text = '';
                                });
                              }
                            } catch (e) {
                              print('Invalid input string $text');
                            }
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
                            textColorNormal: scheme.leadingTextColor
                                .unsafeParameter(widget.state),
                            textColorDisabled: scheme.leadingTextColor
                                .unsafeParameter(widget.state),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: LayoutGrid.halfModule),
                  DoubleSliderWidget(
                    isEnabled: widget.state != TextInputState.disabled,
                    min: widget.minValue,
                    max: widget.maxValue,
                    divisions: widget.divisions,
                    currentRangeValues: _currentRangeValues,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _currentRangeValues = values;
                        widget.textControllerLeading.text =
                            '${values.start.toInt()}';
                        widget.textControllerTrailing.text =
                            '${values.end.toInt()}';
                      });
                      widget.onChanged?.call(_currentRangeValues);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutGrid.module),
        Row(
          children: <Widget>[
            TextView(
              widget.minValue.toInt().toString(),
              font: scheme.valueFont,
              textColorNormal:
                  scheme.valueTextColor.unsafeParameter(widget.state),
            ),
            const Spacer(),
            TextView(
              widget.maxValue.toInt().toString(),
              font: scheme.valueFont,
              textColorNormal:
                  scheme.valueTextColor.unsafeParameter(widget.state),
            ),
          ],
        ),
        const SizedBox(height: LayoutGrid.halfModule * 3),
        if (widget.informerText != null &&
            widget.informerText?.isEmpty == false)
          TextView(
            widget.informerText!,
            font: scheme.textFieldScheme.informerFont,
            textColorNormal: scheme.textFieldScheme.infomerLabelColor
                .unsafeParameter(widget.state),
          ),
      ],
    );
  }
}
