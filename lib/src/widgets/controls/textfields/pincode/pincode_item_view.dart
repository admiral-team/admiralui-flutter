import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class PincodeItem {
  PincodeItem({
    this.icon,
    this.number,
  });

  final Icon? icon;
  final String? number;
}

class PincodeItemView extends StatefulWidget {
  const PincodeItemView({
    super.key,
    this.item,
    this.scheme,
    this.onPressed,
  });

  final PincodeItem? item;
  final PinCodeItemScheme? scheme;
  final VoidCallback? onPressed;

  @override
  State<PincodeItemView> createState() => _PincodeItemState();
}

class _PincodeItemState extends State<PincodeItemView> {
  late PinCodeItemScheme scheme;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    final Color backgroundColor = _isPressed
        ? theme.colors.backgroundSelected.color()
        : Colors.transparent;

    if (widget.item?.number != null) {
      return SizedBox(
        width: LayoutGrid.halfModule * 15,
        height: LayoutGrid.halfModule * 15,
        child: GestureDetector(
          onTap: () => widget.onPressed?.call(),
          onTapUp: (_) => setHighlighted(highlighted: false),
          onTapDown: (_) => setHighlighted(highlighted: true),
          onTapCancel: () => setHighlighted(highlighted: false),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SizedBox(
              width: LayoutGrid.halfModule * 15,
              height: LayoutGrid.halfModule * 15,
              child: Center(
                child: Text(
                  widget.item!.number!,
                  style: const TextStyle(
                    fontSize: 36,
                    fontFamily: '.SF Pro Display',
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else if (widget.item?.icon != null) {
      return SizedBox(
        width: LayoutGrid.halfModule * 15,
        height: LayoutGrid.halfModule * 15,
        child: GestureDetector(
          onTap: () => widget.onPressed?.call(),
          onTapUp: (_) => setHighlighted(highlighted: false),
          onTapDown: (_) => setHighlighted(highlighted: true),
          onTapCancel: () => setHighlighted(highlighted: false),
          child: Center(
            child: widget.item!.icon,
          ),
        ),
      );
    }

    return const SizedBox(
      width: LayoutGrid.halfModule * 15,
      height: LayoutGrid.halfModule * 15,
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
