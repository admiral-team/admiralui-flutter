import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// An enumeration representing the style options for the circular
/// page control slider.
///
/// Values:
/// - `initial`: Represents the initial style of the circular
/// page control slider.
/// - `additional`: Represents an additional or secondary style for the
/// circular page control slider.
///
enum CirclePageSliderStyle { initial, additional }

/// A circular page control widget for indicating the progress or
/// steps in a circular process.
///
/// Constructor:
/// ```
/// CircularPageControl(
///   int steps,
///   int currentStep, {
///     CirclePageSliderStyle style = CirclePageSliderStyle.initial,
///     VoidCallback? onPressed,
///     ValueNotifier<int>? stepNotifier,
///     ValueNotifier<int>? countNotifier,
///     CircularPageControlScheme? scheme,
///     Key? key,
///   }
/// )
/// ```
///
/// Parameters:
/// - `steps`: The total number of steps in the circular process.
/// - `currentStep`: The index of the current step in the circular process.
/// - `style`: The style of the circular page control (initial or additional).
/// - `onPressed`: Callback function triggered when the circular
/// control is pressed.
/// - `stepNotifier`: A [ValueNotifier] that, when provided, allows external
/// control of the current step.
/// - `countNotifier`: A [ValueNotifier] that, when provided, allows dynamic
/// updates to the total number of steps.
/// - `scheme`: An optional scheme defining the appearance of the
/// circular page control.
/// - `key`: An optional key to uniquely identify this widget.
///
/// Example usage:
///
/// CircularPageControl(
///   steps: 5,
///   currentStep: 2,
///   style: CirclePageSliderStyle.initial,
///   onPressed: () {
///     // Handle button press
///   }
/// )
/// ```
///
class CircularPageControl extends StatefulWidget {
  const CircularPageControl(
    this.steps,
    this.currentStep, {
    this.style = CirclePageSliderStyle.initial,
    super.key,
    this.onPressed,
    this.stepNotifier,
    this.countNotifier,
    this.scheme,
  });

  final int steps;
  final int currentStep;
  final CirclePageSliderStyle style;
  final VoidCallback? onPressed;
  final ValueNotifier<int>? stepNotifier;
  final ValueNotifier<int>? countNotifier;
  final CircularPageControlScheme? scheme;

  @override
  State<CircularPageControl> createState() => _CircularPageControlState();
}

class _CircularPageControlState extends State<CircularPageControl>
    with SingleTickerProviderStateMixin {
  late CircularPageControlScheme scheme;
  bool _isPressed = false;

  late double _stepLength;
  late Animation<double> _animation;
  late AnimationController _animationController;
  late Tween<double> _tween;
  late int _currentStep;

  double? get _beginAnimationValue => _currentStep == 0 ? 0.0 : _tween.end;
  double? get _endAnimationValue => _currentStep == 0
      ? _stepLength
      : _stepLength + (_stepLength * _currentStep);
  int get _stepNotifierValue => widget.stepNotifier?.value ?? _currentStep;
  double get _countNotifierValue =>
      widget.countNotifier?.value.toDouble() ?? 0.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final CurvedAnimation curveAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);

    _stepLength = 1.0 / widget.steps.toDouble();
    _tween = Tween<double>(begin: 0.0, end: _stepLength);
    _currentStep = widget.currentStep;

    _animation = _tween.animate(curveAnimation)
      ..addListener(() {
        setState(() {});
      });

    widget.stepNotifier?.addListener(() {
      setState(() {
        _handleStepValueUpdate();
      });
    });

    widget.countNotifier?.addListener(() {
      setState(() {
        _stepLength = 1.0 / _countNotifierValue;
        _currentStep = widget.currentStep;
        _runAnimation(_beginAnimationValue, _endAnimationValue);
      });
    });

    _runAnimation(_beginAnimationValue, _endAnimationValue);
  }

  void _handleStepValueUpdate() {
    if (_currentStep != _stepNotifierValue) {
      if (_currentStep < _stepNotifierValue) {
        _currentStep = _stepNotifierValue;
        _runAnimation(_beginAnimationValue, _endAnimationValue);
      } else if (_currentStep > _stepNotifierValue) {
        if (_stepNotifierValue == 0) {
          _currentStep = _stepNotifierValue;
          _runAnimation(_tween.end, _stepLength);
        } else {
          _currentStep = _stepNotifierValue;
          _runAnimation(_beginAnimationValue, _endAnimationValue);
        }
      }
    }
  }

  void _runAnimation(double? beginAnimation, double? endAnimation) {
    _tween.begin = beginAnimation;
    _animationController.reset();
    _tween.end = endAnimation;
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    widget.stepNotifier?.dispose();
    widget.countNotifier?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CircularPageControlScheme(theme: theme);

    return GestureDetector(
      onTap: () => _onPress(),
      onTapUp: (_) => _setHighlighted(highlighted: false),
      onTapDown: (_) => _setHighlighted(highlighted: true),
      onTapCancel: () => _setHighlighted(highlighted: false),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: LayoutGrid.tripleModule * 3,
                height: LayoutGrid.tripleModule * 3,
                child: CustomPaint(
                  size: const Size(
                    LayoutGrid.tripleModule * 3,
                    LayoutGrid.tripleModule * 3,
                  ),
                  painter: CircularPainter(
                    percentage: _animation.value,
                    color: scheme.backgroundColor.unsafeParameter(
                      _isPressed,
                      widget.style,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  child: Container(
                    width: LayoutGrid.tripleModule * 2,
                    height: LayoutGrid.tripleModule * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: scheme.backgroundColor.unsafeParameter(
                        _isPressed,
                        widget.style,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  child: Icon(
                    AdmiralIcons.admiral_ic_arrow_right_outline,
                    color: scheme.imageTintColor.unsafeParameter(
                      _isPressed,
                      widget.style,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onPress() {
    if (_currentStep < widget.steps) {
      _currentStep += 1;
      _runAnimation(_beginAnimationValue, _endAnimationValue);
      widget.onPressed?.call();
    }
  }

  void _setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
