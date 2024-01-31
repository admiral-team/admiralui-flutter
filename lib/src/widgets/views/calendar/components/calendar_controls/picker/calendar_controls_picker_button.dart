import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CalendarControlsPickerButton extends StatefulWidget {
  const CalendarControlsPickerButton({
    super.key,
    this.onPressed,
    this.isEnable = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final bool isEnable;
  final CalendarControlsPickerButtonScheme? scheme;

  @override
  State<CalendarControlsPickerButton> createState() =>
      _CalendarControlsPickerButtonState();
}

class _CalendarControlsPickerButtonState
    extends State<CalendarControlsPickerButton> {
  late CalendarControlsPickerButtonScheme scheme;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarControlsPickerButtonScheme(theme: theme);

    final Color buttonColorNormal =
        scheme.buttonColor.unsafeParameter(ControlState.normal);
    final Color textColorDisabled =
        scheme.buttonColor.unsafeParameter(ControlState.disabled);
    final Color buttonColor =
        widget.isEnable ? buttonColorNormal : textColorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      child: SizedBox(
        width: LayoutGrid.halfModule * 7,
        height: LayoutGrid.halfModule * 7,
        child: Icon(
          widget.isEnable
              ? AdmiralIcons.admiral_ic_chevron_down_outline
              : AdmiralIcons.admiral_ic_chevron_up_outline,
          color: buttonColor,
        ),
      ),
    );
  }
}
