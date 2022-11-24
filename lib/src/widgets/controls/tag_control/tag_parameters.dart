import 'package:admiralui_flutter/admiralui_flutter.dart';

class TagParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, ControlState forState, TagStyle style) {
    _parameters[key(forState, style)] = parameter;
  }

  T? parameter(ControlState forState, TagStyle style) {
    return _parameters[key(forState, style)];
  }

  String key(ControlState forState, TagStyle style) {
    return forState.name + style.name;
  }

  T unsafeParameter(ControlState forState, TagStyle style) {
    final T? result = _parameters[key(forState, style)];
    if (result != null) {
      return result;
    } else {
      // ignore: lines_longer_than_80_chars
      throw "Parameter with the name '${key(forState, style)}' is undeclared in the "
          'ControlState.';
    }
  }
}
