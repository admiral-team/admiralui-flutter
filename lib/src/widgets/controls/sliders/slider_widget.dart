import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/controls/sliders/circle_thumb_shape.dart';
import 'package:flutter/material.dart';

/// A control for selecting a single value from a continuous range of values.
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
    this.scheme,
  });

  final bool isEnabled;
  final double min;
  final double max;
  final int divisions;
  final double currentSliderValue;
  final ValueChanged<double>? onChanged;
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
      ),
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
    );
  }
}
