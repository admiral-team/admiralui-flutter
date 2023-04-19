import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/layout/layout_grid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarControlsView extends StatefulWidget {
  const CalendarControlsView(
    this.currentDate,
    this.datePickerButtonTitle, {
    this.locale,
    this.onPressedPickerButton,
    this.isDatePickerActive = false,
    this.onPressedSlideRight,
    this.onPressedSlideLeft,
    this.onPressedSelect,
    this.scheme,
  });

  final String? locale;
  final DateTime currentDate;
  final bool isDatePickerActive;
  final String datePickerButtonTitle;
  final VoidCallback? onPressedPickerButton;
  final VoidCallback? onPressedSlideLeft;
  final VoidCallback? onPressedSlideRight;
  final VoidCallback? onPressedSelect;
  final CalendarControlsViewScheme? scheme;

  @override
  State<StatefulWidget> createState() => _CalendarControlsViewState();
}

class _CalendarControlsViewState extends State<CalendarControlsView> {
  static const String dateLocaleFormat = 'LLLL yyyy';
  late CalendarControlsViewScheme scheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppThemeProvider.of(context);
    scheme = widget.scheme ?? CalendarControlsViewScheme(theme: theme);
    return Row(
      children: <Widget>[
        TextView(
          _getDate(),
          font: scheme.font,
          textColorNormal: scheme.textColor.color(),
        ),
        const SizedBox(
          width: LayoutGrid.module,
        ),
        CalendarControlsPickerButton(
          isEnable: widget.isDatePickerActive,
          onPressed: () {
            widget.onPressedPickerButton?.call();
          },
        ),
        const Spacer(),
        if (widget.isDatePickerActive)
          GhostButton(
            sizeType: ButtonSizeType.small,
            title: widget.datePickerButtonTitle,
            onPressed: widget.onPressedSelect,
          ),
        if (!widget.isDatePickerActive)
          CalendarControlsSlideButton(
            AdmiralIcons.admiral_ic_chevron_left_outline,
            onPressed: widget.onPressedSlideLeft,
          ),
        if (!widget.isDatePickerActive)
          const SizedBox(
            width: LayoutGrid.doubleModule,
          ),
        if (!widget.isDatePickerActive)
          CalendarControlsSlideButton(
            AdmiralIcons.admiral_ic_chevron_right_outline,
            onPressed: widget.onPressedSlideRight,
          ),
      ],
    );
  }

  String _getDate() {
    final DateFormat formatter = DateFormat(dateLocaleFormat, widget.locale);
    final String formatted = formatter.format(widget.currentDate);
    return formatted._capitalize();
  }
}

extension StringExtension on String {
  String _capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
