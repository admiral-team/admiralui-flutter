import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatefulWidget {
  const BadgeWidget({
    super.key,
    this.title,
    this.style = BadgeStyle.normal,
    this.isEnable = true,
    this.scheme,
  });

  final String? title;
  final BadgeStyle style;
  final bool isEnable;
  final BadgeScheme? scheme;

  @override
  State<BadgeWidget> createState() => _BadgeWidgetState();
}

class _BadgeWidgetState extends State<BadgeWidget> {
  late BadgeScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? BadgeScheme(theme: theme);

    final Color backgroundColor = scheme.backgroundColor.unsafeParameter(
      widget.isEnable ? ControlState.normal : ControlState.disabled,
      widget.style,
    );
    final Color textColor = scheme.textColor.unsafeParameter(
      widget.isEnable ? ControlState.normal : ControlState.disabled,
    );

    EdgeInsets padding = EdgeInsets.zero;
    BoxConstraints constraints = BoxConstraints(
      minHeight: LayoutGrid.halfModule * 3,
      minWidth: LayoutGrid.halfModule * 3,
    );
    Widget childWidget = DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: scheme.borderColor,
          width: LayoutGrid.halfModule / 2,
        ),
        borderRadius: BorderRadius.circular(LayoutGrid.doubleModule),
      ),
      child: SizedBox(
        width: LayoutGrid.halfModule * 3,
        height: LayoutGrid.halfModule * 3,
      ),
    );

    if (widget.title != null) {
      padding = EdgeInsets.symmetric(
        vertical: LayoutGrid.halfModule,
        horizontal: LayoutGrid.halfModule,
      );
      constraints = BoxConstraints(
        minHeight: LayoutGrid.halfModule * 5,
        minWidth: LayoutGrid.halfModule * 5,
      );

      childWidget = DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: Colors.white,
            width: LayoutGrid.halfModule / 2,
          ),
          borderRadius: BorderRadius.circular(LayoutGrid.doubleModule),
        ),
        child: Container(
          constraints: constraints,
          padding: padding,
          child: Text(
            widget.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: scheme.font.fontSize,
              fontFamily: scheme.font.fontFamily,
              fontWeight: scheme.font.fontWeight,
            ),
          ),
        ),
      );
    }

    return childWidget;
  }
}
