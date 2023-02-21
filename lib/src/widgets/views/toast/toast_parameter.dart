// ignore_for_file: avoid_positional_boolean_parameters

import 'package:admiralui_flutter/admiralui_flutter.dart';

class ToastParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, ToastStyle style) {
    _parameters[key(style)] = parameter;
  }

  T? parameter(ToastStyle style) {
    return _parameters[key(style)];
  }

  String key(ToastStyle style) {
    return style.name;
  }

  T unsafeParameter(ToastStyle style) {
    final T? result = _parameters[key(style)];
    if (result != null) {
      return result;
    } else {
      // ignore: lines_longer_than_80_chars
      throw "Parameter with the name '${key(style)}' is undeclared in the "
          'ControlState.';
    }
  }
}
