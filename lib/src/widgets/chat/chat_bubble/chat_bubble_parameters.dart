import 'package:admiralui_flutter/admiralui_flutter.dart';

class ChatBubbleParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(
    T parameter,
    ChatDirection direction,
  ) {
    _parameters[key(direction)] = parameter;
  }

  T? parameter(
    ChatDirection direction,
  ) {
    return _parameters[key(direction)];
  }

  String key(
    ChatDirection direction,
  ) {
    return direction.name;
  }

  T unsafeParameter(
    ChatDirection direction,
  ) {
    final T? result = _parameters[key(direction)];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${key(direction)}' is undeclared in the "
          'ControlState.';
    }
  }
}
