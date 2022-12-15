import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class TextFieldSeparator extends StatefulWidget {
  const TextFieldSeparator(
    this.state, {
    this.lineHeight = 0.5,
    this.isEditing = false,
    this.scheme,
    super.key,
  });

  final TextInputState state;
  final double lineHeight;
  final bool isEditing;
  final TextFieldSeparatorScheme? scheme;

  @override
  State<StatefulWidget> createState() => _TextFieldSeparatorState();
}

class _TextFieldSeparatorState extends State<TextFieldSeparator> {
  late TextFieldSeparatorScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? TextFieldSeparatorScheme(theme: theme);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double boxWidth = constraints.constrainWidth();
        final double lineWidth = widget.state == TextInputState.readOnly
            ? LayoutGrid.halfModule
            : constraints.constrainWidth();
        final int linesCount = widget.state == TextInputState.readOnly
            ? (boxWidth / (2 * lineWidth)).floor()
            : 1;

        final Color errorColor =
            scheme.lineColor.unsafeParameter(TextInputState.error);
        final Color lineDefaultColor = widget.isEditing
            ? scheme.lineColor.unsafeParameter(widget.state)
            : scheme.lineColor.unsafeParameter(TextInputState.readOnly);
        final Color lineColor = widget.state == TextInputState.error
            ? errorColor
            : lineDefaultColor;

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List<Widget>.generate(linesCount, (_) {
            return SizedBox(
              width: lineWidth,
              height: widget.lineHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: lineColor,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
