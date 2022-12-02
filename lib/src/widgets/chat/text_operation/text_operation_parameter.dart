import 'package:admiralui_flutter/admiralui_flutter.dart';
import 'package:admiralui_flutter/src/widgets/chat/text_operation/text_operation_style.dart';

class TextOperationParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, ControlState forState, TextOperationStyle style) {
    _parameters[key(forState, style)] = parameter;
  }

  T? parameter(ControlState forState, TextOperationStyle style) {
    return _parameters[key(forState, style)];
  }

  String key(ControlState forState, TextOperationStyle style) {
    return forState.name + style.name;
  }

  T unsafeParameter(ControlState forState, TextOperationStyle style) {
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
