import 'package:admiralui_flutter/src/widgets/views/textfields/textfield/textfield.dart';

class TextFieldControlParameter<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, TextInputState forState) {
    _parameters[forState.name] = parameter;
  }

  T? parameter(TextInputState forState) {
    return _parameters[forState.name];
  }

  T unsafeParameter(TextInputState forState) {
    final T? result = _parameters[forState.name];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${forState.name}' is undeclared in the "
          'ControlState.';
    }
  }
}
