import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/controls/sliders/circle_thumb_shape.dart';
import 'package:flutter/material.dart';

/// A control for selecting a single value from a continuous range of values.
///
/// Constructor:
/// ```
/// SliderWidget(
///   bool isEnabled,
///   double min,
///   double max
///   int divisions
///   ValueChanged<double>? onChanged
///   ValueNotifier<double>? textFieldChange
///   SliderScheme? scheme
/// )
/// ```
///
/// Parameters:
/// - `isEnabled`: The flag that controls enable/disable state.
/// - `min`: The minimum value the user can select.
/// - `max`: The maximum value the user can select.
/// - `divisions`: The number of discrete divisions.
/// - `onChanged`: Called during a drag when the user is selecting a
/// new value for the slider by dragging.
/// - `textFieldChange`: The notifier that calls when user change
/// textfield text.
/// - `scheme`: The visial scheme of SliderWidget.
/// - `key`: An optional key to uniquely identify this widget.
///
/// Example usage:
/// ```dart
///SliderWidget(
///   isEnabled: widget.state != TextInputState.disabled,
///   min: widget.minLabelText,
///   max: widget.maxLabelText,
///   divisions: widget.divisions,
///   currentSliderValue: _currentSliderValue,
///   textFieldChange: notifier,
///   onChanged: (double value) => setState(() {
///     _currentSliderValue = value;
///     widget.controller.text = '${value.toInt()}';
///   }),
///),
/// ```
///
class SliderWidget extends StatefulWidget {
  /// Creates a SliderWidget.
  const SliderWidget({
    super.key,
    this.isEnabled = true,
    this.min = 0,
    this.max = 100,
    this.divisions = 100,
    this.currentSliderValue = 0,
    this.onChanged,
    this.textFieldChange,
    this.scheme,
  });

  final bool isEnabled;
  final double min;
  final double max;
  final int divisions;
  final double currentSliderValue;
  final ValueChanged<double>? onChanged;
  final ValueNotifier<double>? textFieldChange;
  final SliderScheme? scheme;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 0;
  late SliderScheme scheme;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.currentSliderValue;
    widget.textFieldChange?.addListener(
      () {
        setState(() {
          _currentSliderValue = widget.textFieldChange?.value ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.textFieldChange?.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? SliderScheme(theme: theme);

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: LayoutGrid.halfModule / 2,
        activeTrackColor: scheme.activeColor.unsafeParameter(widget.isEnabled),
        inactiveTrackColor:
            scheme.inActiveColor.unsafeParameter(widget.isEnabled),
        thumbColor: scheme.thumbColor.unsafeParameter(widget.isEnabled),
        thumbShape: CircleThumbShape(
          fillColor: scheme.tintColor.unsafeParameter(widget.isEnabled),
          borderColor: scheme.thumbColor.unsafeParameter(widget.isEnabled),
        ),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LayoutGrid.halfModule),
        child: Slider(
          value: _currentSliderValue,
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          activeColor: scheme.activeColor.unsafeParameter(widget.isEnabled),
          inactiveColor: scheme.inActiveColor.unsafeParameter(widget.isEnabled),
          thumbColor: scheme.thumbColor.unsafeParameter(widget.isEnabled),
          onChanged: (double value) {
            setState(() {
              if (widget.isEnabled) {
                _currentSliderValue = value;
                widget.onChanged?.call(value);
              }
            });
          },
        ),
      ),
    );
  }
}
