import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// Alignment textfields. 3 state:
/// Fixed width left textfeild,
/// fixed width right textfield,
/// ratio left to right textfield.
class DoubleTextFieldAlignment {
  const DoubleTextFieldAlignment({
    this.leftTextFieldFixedWidth,
    this.rightTextFieldProportion,
    this.ratio,
  });
  final double? leftTextFieldFixedWidth;
  final double? rightTextFieldProportion;
  final int? ratio;
}

/// DoubleTextField - An object that contains two textfields
/// that located at the left and right edge.
class DoubleTextField extends StatefulWidget {
  const DoubleTextField(
    this.leftTextField,
    this.rightTextField,
    this.alignment, {
    super.key,
  });
  final Widget leftTextField;
  final Widget rightTextField;
  final DoubleTextFieldAlignment alignment;

  @override
  State<StatefulWidget> createState() => _DoubleTextFieldState();
}

class _DoubleTextFieldState extends State<DoubleTextField>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.alignment.ratio != null) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: widget.alignment.ratio!,
            child: widget.leftTextField,
          ),
          const SizedBox(
            width: LayoutGrid.doubleModule,
          ),
          Expanded(
            flex: 100 - widget.alignment.ratio!,
            child: widget.rightTextField,
          ),
        ],
      );
    } else if (widget.alignment.leftTextFieldFixedWidth != null) {
      return Row(
        children: <Widget>[
          SizedBox(
            width: widget.alignment.leftTextFieldFixedWidth,
            child: widget.leftTextField,
          ),
          const SizedBox(
            width: LayoutGrid.doubleModule,
          ),
          Flexible(child: widget.rightTextField),
        ],
      );
    } else if (widget.alignment.rightTextFieldProportion != null) {
      return Row(
        children: <Widget>[
          Flexible(child: widget.leftTextField),
          const SizedBox(
            width: LayoutGrid.doubleModule,
          ),
          SizedBox(
            width: widget.alignment.rightTextFieldProportion,
            child: widget.rightTextField,
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: widget.leftTextField,
          ),
          const SizedBox(
            width: LayoutGrid.doubleModule,
          ),
          Expanded(
            flex: 50,
            child: widget.rightTextField,
          ),
        ],
      );
    }
  }
}
