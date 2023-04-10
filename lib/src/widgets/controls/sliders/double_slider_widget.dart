import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// A control for selecting a double value from a continuous range of values.
class DoubleSliderWidget extends StatefulWidget {
  /// Creates a DoubleSliderWidget.
  const DoubleSliderWidget({
    super.key,
    this.isEnabled = true,
    this.min = 0,
    this.max = 100,
    this.divisions = 100,
    this.currentRangeValues,
    this.onChanged,
    this.scheme,
  });

  final bool isEnabled;
  final double min;
  final double max;
  final int divisions;
  final RangeValues? currentRangeValues;
  final ValueChanged<RangeValues>? onChanged;
  final SliderScheme? scheme;

  @override
  State<DoubleSliderWidget> createState() => _DoubleSliderWidgetState();
}

class _DoubleSliderWidgetState extends State<DoubleSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);
  late SliderScheme scheme;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = widget.currentRangeValues 
    ?? RangeValues(widget.min, widget.max);
  }

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
      ),
      child: RangeSlider(
        min: widget.min,
        max: widget.max,
        values: _currentRangeValues,   
        divisions: widget.divisions,
        activeColor: scheme.activeColor.unsafeParameter(widget.isEnabled),
        inactiveColor: scheme.inActiveColor.unsafeParameter(widget.isEnabled),
        onChanged: (RangeValues value) {
          setState(() {
            if (widget.isEnabled) {
              _currentRangeValues = value;
              widget.onChanged?.call(value);
            }
          });
        },
      ),
    );
  }
}
