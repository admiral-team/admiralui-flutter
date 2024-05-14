import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class PincodeItem {
  PincodeItem({
    this.leadingWidget,
    this.trailingWidget,
    this.number,
  });

  final Widget? leadingWidget;
  final Widget? trailingWidget;
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
  final PincodeViewScheme? scheme;
  final VoidCallback? onPressed;

  @override
  State<PincodeItemView> createState() => _PincodeItemState();
}

class _PincodeItemState extends State<PincodeItemView> {
  late PincodeViewScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? PincodeViewScheme(theme: theme);

    if (widget.item?.number != null) {
      return SizedBox(
        width: LayoutGrid.halfModule * 15,
        height: LayoutGrid.halfModule * 15,
        child: GestureDetector(
          onTap: () => widget.onPressed?.call(),
          child: Center(
            child: TextView(
              widget.item!.number!,
              font: scheme.titleFont,
              textColorNormal: scheme.numberLabelColor,
            ),

            // Text(
            //   widget.item!.number!,
            //   style: TextStyle(
            //     color: scheme.numberLabelColor,
            //     fontSize: 36,
            //     fontFamily: '.SF Pro Display',
            //   ),
            // ),
          ),
        ),
      );
    } else if (widget.item?.leadingWidget != null) {
      return SizedBox(
        width: LayoutGrid.halfModule * 15,
        height: LayoutGrid.halfModule * 15,
        child: GestureDetector(
          onTap: () => widget.onPressed?.call(),
          child: Center(
            child: widget.item!.leadingWidget,
          ),
        ),
      );
    } else if (widget.item?.trailingWidget != null) {
      return SizedBox(
        width: LayoutGrid.halfModule * 15,
        height: LayoutGrid.halfModule * 15,
        child: GestureDetector(
          onTap: () => widget.onPressed?.call(),
          child: Center(
            child: widget.item!.trailingWidget,
          ),
        ),
      );
    }

    return const SizedBox(
      width: LayoutGrid.halfModule * 15,
      height: LayoutGrid.halfModule * 15,
    );
  }
}
