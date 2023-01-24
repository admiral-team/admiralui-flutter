import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

enum CirclePageSliderStyle { initial, additional }

class CircularPageControl extends StatefulWidget {
  const CircularPageControl(
    this.steps,
    this.currentStep, {
    this.animationDuration = 500,
    this.style = CirclePageSliderStyle.initial,
    super.key,
    this.onPressed,
    this.tween,
    this.animatedController,
    this.scheme,
  });

  final int steps;
  final int currentStep;
  final int animationDuration;
  final CirclePageSliderStyle style;
  final VoidCallback? onPressed;
  final Tween<double>? tween;
  final AnimationController? animatedController;
  final CircularPageControlScheme? scheme;

  @override
  State<CircularPageControl> createState() => _CircularPageControlState();
}

class _CircularPageControlState extends State<CircularPageControl>
    with SingleTickerProviderStateMixin {
  late CircularPageControlScheme scheme;
  bool _isPressed = false;

  late double stepLength;
  late Animation<double> animation;
  late AnimationController animController;
  late Tween<double> _tween;
  late int _currentStep;

  @override
  void initState() {
    super.initState();
    _currentStep = widget.currentStep;
    animController = widget.animatedController == null
        ? AnimationController(
            duration: Duration(milliseconds: widget.animationDuration),
            vsync: this,
          )
        : widget.animatedController!;
    final CurvedAnimation curveAnimation =
        CurvedAnimation(parent: animController, curve: Curves.linear);

    stepLength = 1.0 / widget.steps.toDouble();
    _tween = widget.tween == null
        ? Tween<double>(begin: 0.0, end: stepLength)
        : widget.tween!;

    animation = _tween.animate(curveAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  void runAnimation() {
    _tween.begin = _currentStep == 0 ? 0.0 : _tween.end;
    animController.reset();
    _tween.end = _currentStep == 0
        ? stepLength
        : stepLength + (stepLength * _currentStep);
    animController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CircularPageControlScheme(theme: theme);

    return GestureDetector(
      onTap: () => onPress(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
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
                    percentage: animation.value,
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

  void onPress() {
    setState(() {
      if (widget.animatedController == null) {
        runAnimation();
      }

      if (_currentStep < widget.steps) {
        _currentStep += 1;
      }

      widget.onPressed?.call();
    });
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
