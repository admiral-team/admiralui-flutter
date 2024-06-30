import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:admiralui_flutter/src/widgets/views/cell/base_cell_scheme.dart';
import 'package:admiralui_flutter/theme/app_theme.dart';
import 'package:admiralui_flutter/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';

class BaseCellWidget extends StatefulWidget {
  const BaseCellWidget({
    super.key,
    this.onPressed,
    this.leadingCell,
    this.centerCell,
    this.trailingCell,
    this.borderRadius = 0.0,
    this.isEnabled = true,
    this.scheme,
    this.horizontalPadding = LayoutGrid.doubleModule,
  });

  final VoidCallback? onPressed;
  final Widget? leadingCell;
  final Widget? trailingCell;
  final Widget? centerCell;
  final double borderRadius;
  final bool isEnabled;
  final BaseCellScheme? scheme;
  final double horizontalPadding;

  @override
  State<BaseCellWidget> createState() => _BaseCellWidgetState();
}

class _BaseCellWidgetState extends State<BaseCellWidget> {
  late BaseCellScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? BaseCellScheme(theme: theme);

    final Color color =
        widget.isEnabled ? scheme.defaultColor : scheme.disabledColor;
    return Opacity(
      opacity: widget.isEnabled ? 1 : 0.6,
      child: IgnorePointer(
        ignoring: !widget.isEnabled,
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              widget.borderRadius,
            ),
          ),
          child: InkWell(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            highlightColor: scheme.selectedColor,
            splashColor: scheme.selectedColor,
            onTap: () {
              if (widget.isEnabled) {
                widget.onPressed?.call();
              }
            },
            child: Container(
              constraints: const BoxConstraints(
                minHeight: LayoutGrid.module * 9,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: LayoutGrid.halfModule * 3,
              ),
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: widget.horizontalPadding,
                  ),
                  if (widget.leadingCell != null)
                    SizedBox(
                      width: LayoutGrid.halfModule * 11,
                      height: LayoutGrid.halfModule * 11,
                      child: widget.leadingCell ?? Container(),
                    ),
                  if (widget.leadingCell != null)
                    const SizedBox(
                      width: LayoutGrid.doubleModule,
                    ),
                  Expanded(
                    child: widget.centerCell ?? Container(),
                  ),
                  widget.trailingCell ?? Container(),
                  SizedBox(
                    width: widget.horizontalPadding,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
