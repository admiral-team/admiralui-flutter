import 'package:admiralui_flutter/src/widgets/views/cell/base_cell_scheme.dart';
import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:admiralui_flutter/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

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
  const BaseCellWidget({
    Key? key,
    this.onPressed,
    this.leadingCell,
    this.centerCell,
    this.trailingCell,
    this.borderRadius = 0.0,
    this.isEnabled = true,
    this.scheme,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? leadingCell;
  final Widget? trailingCell;
  final Widget? centerCell;
  final double borderRadius;
  final bool isEnabled;
  final BaseCellScheme? scheme;

  @override
  State<BaseCellWidget> createState() => _BaseCellWidgetState();
}

class _BaseCellWidgetState extends State<BaseCellWidget> {
  late BaseCellScheme scheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? BaseCellScheme(theme: theme);

    final Color color =
        widget.isEnabled ? scheme.defaultColor : scheme.disabledColor;
    return Ink(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          widget.borderRadius,
        ),
      ),
      child: InkWell(
        highlightColor: scheme.selectedColor,
        splashColor: scheme.selectedColor,
        onTap: () {
          widget.onPressed?.call();
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 2.0,
            right: 2.0,
            bottom: 14.0,
            top: 14.0,
          ),
          width: double.infinity,
          child: Row(
            children: <Widget>[
              widget.leadingCell ?? Container(),
              const SizedBox(width: 8.0),
              widget.centerCell ?? Container(),
              const Spacer(),
              widget.trailingCell ?? Container()
            ],
          ),
        ),
      ),
    );
  }
}
