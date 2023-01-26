import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

enum CirclePageSliderStyle { initial, additional }

class CircularPageControl extends StatefulWidget {
  const CircularPageControl(
    this.steps,
    this.currentStep, {
    this.style = CirclePageSliderStyle.initial,
    super.key,
    this.onPressed,
    this.stepNotifier,
    this.scheme,
  });

  final int steps;
  final int currentStep;
  final CirclePageSliderStyle style;
  final VoidCallback? onPressed;
  final ValueNotifier<int>? stepNotifier;
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
  int get _stepNofifierValue => widget.stepNotifier?.value ?? _currentStep;

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

    _runAnimation(_beginAnimationValue, _endAnimationValue);
  }

  void _handleStepValueUpdate() {
    if (_currentStep != _stepNofifierValue) {
      if (_currentStep < _stepNofifierValue) {
        _currentStep = _stepNofifierValue;
        _runAnimation(_beginAnimationValue, _endAnimationValue);
      } else if (_currentStep > _stepNofifierValue) {
        if (_stepNofifierValue == 0) {
          _currentStep = _stepNofifierValue;
          _runAnimation(_tween.end, _stepLength);
        } else {
          _currentStep = _stepNofifierValue;
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
