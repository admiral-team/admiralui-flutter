import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';

/// The button that corresponds to select month
/// and year of the calendar when date picker shown.
///
/// Constructor:
/// ```
/// CalendarChooseButton(
///   VoidCallback? onPressed,
///   bool isEnable,
///   CalendarChooseButtonScheme? scheme
/// )
/// ```
///
/// Parameters:
/// - `onPressed`: The button tap event.
/// - `isEnable`: The flag that control enable/disbale state of button.
/// - `scheme`: An optional scheme defining the appearance of the
/// CalendarChooseButton.
/// - `key`: An optional key to uniquely identify this widget.
///
/// Example usage:
/// ```dart
/// CalendarChooseButton(
///   onPressed: {}
/// )
/// ```
///
class CalendarChooseButton extends StatefulWidget {
  const CalendarChooseButton({
    super.key,
    this.onPressed,
    this.isEnable = true,
    this.scheme,
  });

  final VoidCallback? onPressed;
  final bool isEnable;
  final CalendarChooseButtonScheme? scheme;

  @override
  State<CalendarChooseButton> createState() => _CalendarChooseButtonState();
}

class _CalendarChooseButtonState extends State<CalendarChooseButton> {
  late CalendarChooseButtonScheme scheme;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarChooseButtonScheme(theme: theme);

    final Color textColorNormal =
        scheme.textColor.unsafeParameter(ControlState.normal);
    final Color textColorHighlighted =
        scheme.textColor.unsafeParameter(ControlState.highlighted);
    final Color textColorDisabled =
        scheme.textColor.unsafeParameter(ControlState.disabled);
    final Color textColor = widget.isEnable
        ? (_isPressed ? textColorHighlighted : textColorNormal)
        : textColorDisabled;

    return GestureDetector(
      onTap: () => widget.onPressed?.call(),
      onTapUp: (_) => setHighlighted(highlighted: false),
      onTapDown: (_) => setHighlighted(highlighted: true),
      onTapCancel: () => setHighlighted(highlighted: false),
      child: SizedBox(
        width: LayoutGrid.module * 10,
        child: TextView(
          'Выбрать',
          font: scheme.font,
          textColorNormal: textColor,
          textColorDisabled: textColorDisabled,
        ),
      ),
    );
  }

  void setHighlighted({required bool highlighted}) {
    setState(() {
      _isPressed = highlighted;
    });
  }
}
