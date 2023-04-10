// ignore_for_file: avoid_positional_boolean_parameters
import 'package:admiralui_flutter/admiralui_flutter.dart';

class CircularPageControlParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, bool isPressing, CirclePageSliderStyle style) {
    _parameters[key(isPressing, style)] = parameter;
  }

  T? parameter(bool isPressing, CirclePageSliderStyle style) {
    return _parameters[key(isPressing, style)];
  }

  String key(bool isPressing, CirclePageSliderStyle style) {
    return isPressing.toString() + style.name;
  }

  T unsafeParameter(bool isPressing, CirclePageSliderStyle style) {
    final T? result = _parameters[key(isPressing, style)];
    if (result != null) {
      return result;
    } else {
      // ignore: lines_longer_than_80_chars
      throw "Parameter with the name '${key(isPressing, style)}' is undeclared in the "
          'ControlState.';
    }
  }
}
