import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/theme/admiral_color.dart';
import 'package:flutter/material.dart';

class CalendarDayViewScheme {
  CalendarDayViewScheme({
    required this.theme,
  }) {
    titleLabelFont = theme.fonts.body1;
    currentDayIndicatorColor = theme.colors.backgroundAccent;

    backgroundColor.set(
      theme.colors.backgroundBasic.color(),
      CalendarDayItemState.regular,
    );

    backgroundColor.set(
      theme.colors.backgroundAccent.color(),
      CalendarDayItemState.selected,
    );

    backgroundColor.set(
      theme.colors.backgroundSelected.color(),
      CalendarDayItemState.inRange,
    );

    backgroundColor.set(
      theme.colors.backgroundBasic.color(),
      CalendarDayItemState.current,
    );

    backgroundColor.set(
      theme.colors.backgroundBasic.color(),
      CalendarDayItemState.notVisible,
    );

    backgroundColor.set(
      theme.colors.backgroundBasic.color(),
      CalendarDayItemState.inactive,
    );

    borderColor.set(
      theme.colors.backgroundBasic.color(),
      CalendarDayItemState.regular,
    );

    borderColor.set(
      theme.colors.textAccent.color(),
      CalendarDayItemState.selected,
    );

    borderColor.set(
      theme.colors.backgroundSelected.color(),
      CalendarDayItemState.inRange,
    );

    borderColor.set(
      theme.colors.textPrimary.color(),
      CalendarDayItemState.current,
    );

    borderColor.set(
      theme.colors.backgroundBasic.color(),
      CalendarDayItemState.notVisible,
    );

    borderColor.set(
      theme.colors.backgroundBasic.color(),
      CalendarDayItemState.inactive,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      CalendarDayItemState.regular,
    );

    textColor.set(
      theme.colors.textStaticWhite.color(),
      CalendarDayItemState.selected,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      CalendarDayItemState.inRange,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      CalendarDayItemState.notVisible,
    );

    textColor.set(
      theme.colors.textPrimary.color(),
      CalendarDayItemState.current,
    );

    textColor.set(
      theme.colors.textPrimary.colorWithOpacity(),
      CalendarDayItemState.inactive,
    );
  }

  AppTheme theme;
  late AFont titleLabelFont;
  late AColor currentDayIndicatorColor;
  CalendarDayParameter<Color> textColor = CalendarDayParameter<Color>();
  CalendarDayParameter<Color> borderColor = CalendarDayParameter<Color>();
  CalendarDayParameter<Color> backgroundColor = CalendarDayParameter<Color>();
}

class CalendarDayParameter<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, CalendarDayItemState state) {
    _parameters[key(state)] = parameter;
  }

  T? parameter(CalendarDayItemState state) {
    return _parameters[key(state)];
  }

  String key(CalendarDayItemState state) {
    return state.name;
  }

  T unsafeParameter(CalendarDayItemState state) {
    final T? result = _parameters[key(state)];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${key(state)}' is undeclared in"
          ' the ControlState.';
    }
  }
}
