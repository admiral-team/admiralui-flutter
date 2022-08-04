import 'package:flutter/material.dart';
import 'package:admiralui_flutter/src/Widgets/Views/Cell/base_cell_scheme.dart';

/// BaseCellWidget - a view that displays leading, trailing and image views
///
/// You can create a BaseCellWidget by using parameters in initializer:
/// VoidCallback? onPressed  - The tap action of BaseCellWidget
/// Widget? leadingCell - The leading view of BaseCellWidget.
/// Widget? centerCell - The center view of BaseCellWidget.
/// Widget? trailingCell- The trailing view of BaseCellWidget.
/// double borderRadius- The border radius of BaseCellWidget.
/// bool isEnabled - The flag that controls enabled/disabled state of BaseCellWidget.
///
class BaseCellWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? leadingCell;
  final Widget? trailingCell;
  final Widget? centerCell;
  final double borderRadius;
  final bool isEnabled;
  final BaseCellScheme? scheme;

  const BaseCellWidget(
      {Key? key,
      this.onPressed,
      this.leadingCell,
      this.centerCell,
      this.trailingCell,
      this.borderRadius = 0.0,
      this.isEnabled = true,
      this.scheme})
      : super(key: key);

  @override
  State<BaseCellWidget> createState() => _BaseCellWidgetState();
}

class _BaseCellWidgetState extends State<BaseCellWidget> {
  late BaseCellScheme scheme;
  bool _isPressed = false;
  @override
  void initState() {
    super.initState();
    scheme = widget.scheme ?? BaseCellScheme();
  }

  @override
  Widget build(BuildContext context) {
    var color = (widget.isEnabled
        ? (_isPressed ? scheme.selectedColor : scheme.deafultColor)
        : scheme.disabledColor);
    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(false),
      onTapDown: (_) => setHighlighted(true),
      onTapCancel: () => setHighlighted(false),
      child: Container(
        padding: const EdgeInsets.only(
          left: 2.0,
          right: 2.0,
          bottom: 14.0,
          top: 14.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Row(children: [
          widget.leadingCell ?? Container(),
          const SizedBox(width: 8.0),
          widget.centerCell ?? Container(),
          const Spacer(),
          widget.trailingCell ?? Container()
        ]),
      ),
    );
  }

  setHighlighted(bool highlighted) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
