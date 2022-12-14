// ignore_for_file: avoid_positional_boolean_parameters

import 'package:admiralui_flutter/src/widgets/views/informers/informer_style.dart';

class InformerParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, bool isEnabled, InformerStyle style) {
    _parameters[key(isEnabled, style)] = parameter;
  }

  T? parameter(bool isEnabled, InformerStyle style) {
    return _parameters[key(isEnabled, style)];
  }

  String key(bool isEnabled, InformerStyle style) {
    return isEnabled.toString() + style.name;
  }

  T unsafeParameter(bool isEnabled, InformerStyle style) {
    final T? result = _parameters[key(isEnabled, style)];
    if (result != null) {
      return result;
    } else {
      // ignore: lines_longer_than_80_chars
      throw "Parameter with the name '${key(isEnabled, style)}' is undeclared in the "
          'ControlState.';
    }
  }
}
