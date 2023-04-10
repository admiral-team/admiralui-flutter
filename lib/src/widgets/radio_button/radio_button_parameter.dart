import 'package:admiralui_flutter/admiralui_flutter.dart';

class RadioButtonParameter<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, ControlState forState, RadioButtonStyle style) {
    _parameters[key(forState, style)] = parameter;
  }

  T? parameter(ControlState forState, RadioButtonStyle style) {
    return _parameters[key(forState, style)];
  }

  String key(ControlState forState, RadioButtonStyle style) {
    return forState.name + style.name;
  }

  T unsafeParameter(ControlState forState, RadioButtonStyle style) {
    final T? result = _parameters[key(forState, style)];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${key(forState, style)}' is undeclared in"
          ' the ControlState.';
    }
  }
}
