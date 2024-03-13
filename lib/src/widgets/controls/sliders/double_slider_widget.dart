import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A control for selecting a double value from a continuous range of values.
///
/// This widget provides a slider that allows the user to select a range of
/// double values between a specified minimum and maximum. It supports real-time
/// updates and customization of appearance.
///
/// Constructor:
/// ```
/// DoubleSliderWidget({
///   Key? key,
///   required RangeValues currentRangeValues,
///   bool isEnabled = true,
///   double min = 0,
///   double max = 100,
///   int divisions = 100,
///   ValueChanged<RangeValues>? onChanged,
///   SliderScheme? scheme,
/// })
/// ```
///
/// Parameters:
/// - `currentRangeValues`: The initial range values for the slider.
/// - `isEnabled`: A boolean indicating whether the slider
/// is enabled or disabled.
///   Defaults to `true`.
/// - `min`: The minimum value of the range. Defaults to `0`.
/// - `max`: The maximum value of the range. Defaults to `100`.
/// - `divisions`: The number of divisions for the slider. Defaults to `100`.
/// - `onChanged`: A callback function called when the slider values change.
/// - `scheme`: An optional `SliderScheme` object that defines the appearance
///   of the slider.
///
/// Example usage:
/// ```dart
/// DoubleSliderWidget(
///   currentRangeValues: RangeValues(20, 80),
///   isEnabled: true,
///   min: 0,
///   max: 100,
///   divisions: 100,
///   onChanged: (RangeValues values) {
///     // Handle range values change
///   },
///   scheme: SliderScheme.light(),
/// )
/// ```
class DoubleSliderWidget extends StatefulWidget {
  /// Creates a DoubleSliderWidget.
  const DoubleSliderWidget({
    super.key,
    required this.currentRangeValues,
    this.isEnabled = true,
    this.min = 0,
    this.max = 100,
    this.divisions = 100,
    this.onChanged,
    this.scheme,
  });

  final bool isEnabled;
  final double min;
  final double max;
  final int divisions;
  final RangeValues currentRangeValues;
  final ValueChanged<RangeValues>? onChanged;
  final SliderScheme? scheme;

  @override
  State<DoubleSliderWidget> createState() => _DoubleSliderWidgetState();
}

class _DoubleSliderWidgetState extends State<DoubleSliderWidget> {
  late SliderScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? SliderScheme(theme: theme);

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: LayoutGrid.halfModule / 2,
        rangeThumbShape: CustomThumbShape(
          fillColor: scheme.tintColor.unsafeParameter(widget.isEnabled),
          borderColor: scheme.thumbColor.unsafeParameter(widget.isEnabled),
        ),
        activeTrackColor: scheme.activeColor.unsafeParameter(widget.isEnabled),
        inactiveTrackColor: scheme.inActiveColor.unsafeParameter(
          widget.isEnabled,
        ),
        thumbColor: scheme.thumbColor.unsafeParameter(widget.isEnabled),
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: LayoutGrid.halfModule),
        child: RangeSlider(
          min: widget.min,
          max: widget.max,
          values: widget.currentRangeValues,
          divisions: widget.divisions,
          activeColor: scheme.activeColor.unsafeParameter(widget.isEnabled),
          inactiveColor: scheme.inActiveColor.unsafeParameter(widget.isEnabled),
          onChanged: (RangeValues value) {
            setState(() {
              if (widget.isEnabled) {
                widget.onChanged?.call(value);
              }
            });
          },
        ),
      ),
    );
  }
}
