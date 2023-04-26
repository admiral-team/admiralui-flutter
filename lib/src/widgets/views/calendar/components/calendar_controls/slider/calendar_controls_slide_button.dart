import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

class CalendarControlsSlideButton extends StatefulWidget {
  const CalendarControlsSlideButton(
    this.iconData, {
    super.key,
    this.onPressed,
    this.isEnable = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final bool isEnable;
  final IconData iconData;
  final CalendarControlsPickerButtonScheme? scheme;

  @override
  State<CalendarControlsSlideButton> createState() =>
      _CalendarControlsSlideButton();
}

class _CalendarControlsSlideButton extends State<CalendarControlsSlideButton> {
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
          widget.iconData,
          color: buttonColor,
        ),
      ),
    );
  }
}
