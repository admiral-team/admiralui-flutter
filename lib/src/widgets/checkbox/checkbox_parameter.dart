import 'package:admiralui_flutter/admiralui_flutter.dart';

class CheckboxParameter<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, ControlState forState, CheckboxStyle style) {
    _parameters[key(forState, style)] = parameter;
  }

  T? parameter(ControlState forState, CheckboxStyle style) {
    return _parameters[key(forState, style)];
  }

  String key(ControlState forState, CheckboxStyle style) {
    return forState.name + style.name;
  }

  T unsafeParameter(ControlState forState, CheckboxStyle style) {
    final T? result = _parameters[key(forState, style)];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${key(forState, style)}' is undeclared in"
          ' the ControlState.';
    }
  }
}
