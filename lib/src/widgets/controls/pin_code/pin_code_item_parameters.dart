import 'package:admiralui_flutter/admiralui_flutter.dart';

class PinCodeItemParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, CodeInputStatus status) {
    _parameters[key(status)] = parameter;
  }

  T? parameter(CodeInputStatus status) {
    return _parameters[key(status)];
  }

  String key(CodeInputStatus status) {
    return status.name;
  }

  T unsafeParameter(CodeInputStatus status) {
    final T? result = _parameters[key(status)];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${key(status)}' "
          'is undeclared in the ControlState.';
    }
  }
}
