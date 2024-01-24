import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:flutter/material.dart';

enum ShimmerDirection { leftToRight, rightToleft, topToBotton, bottomToTop }

@immutable
class Shimmer extends StatefulWidget {
  const Shimmer({
    required this.child,
    this.direction = ShimmerDirection.leftToRight,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
    this.scheme,
  });

  final Widget child;
  final Duration period;
  final ShimmerDirection direction;
  final int loop;
  final bool enabled;
  final ShimmerScheme? scheme;

  @override
  _ShimmerState createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Gradient _gradient;
  late ShimmerScheme scheme;

  int _count = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.period)
      ..addStatusListener((AnimationStatus status) {
        if (status != AnimationStatus.completed) {
          return;
        }
        _count++;
        if (widget.loop <= 0) {
          _controller.repeat();
        } else if (_count < widget.loop) {
          _controller.forward(from: 0.0);
        }
      });
    if (widget.enabled) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    if (widget.enabled) {
      _controller.forward();
    } else {
      _controller.stop();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? ShimmerScheme(theme: theme);

    _gradient = LinearGradient(
      begin: Alignment.topLeft,
      colors: <Color>[
        scheme.backgroundShimmerColor.color(),
        scheme.backgroundShimmerColor.color(),
        scheme.shimmerColor.color(),
        scheme.backgroundShimmerColor.color(),
        scheme.backgroundShimmerColor.color(),
      ],
      stops: const <double>[0.0, 0.35, 0.5, 0.65, 1.0],
    );

    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget? child) => ShimmeRenderObject(
        direction: widget.direction,
        gradient: _gradient,
        percent: _controller.value,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
