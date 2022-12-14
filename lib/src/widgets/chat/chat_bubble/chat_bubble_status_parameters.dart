import 'package:admiralui_flutter/admiralui_flutter.dart';

class ChatBubbleStatusParameters<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(
    T parameter,
    ControlState forState,
    ChatBubbleStatusStyle style,
    ChatDirection direction,
    ChatStatus status,
  ) {
    _parameters[key(forState, style, direction, status)] = parameter;
  }

  T? parameter(
    ControlState forState,
    ChatBubbleStatusStyle style,
    ChatDirection direction,
    ChatStatus status,
  ) {
    return _parameters[key(forState, style, direction, status)];
  }

  String key(
    ControlState forState,
    ChatBubbleStatusStyle style,
    ChatDirection direction,
    ChatStatus status,
  ) {
    return forState.name + style.name + direction.name + status.name;
  }

  T unsafeParameter(
    ControlState forState,
    ChatBubbleStatusStyle style,
    ChatDirection direction,
    ChatStatus status,
  ) {
    final T? result = _parameters[key(forState, style, direction, status)];
    if (result != null) {
      return result;
    } else {
      // ignore: lines_longer_than_80_chars
      throw "Parameter with the name '${key(forState, style, direction, status)}' is undeclared in the "
          'ControlState.';
    }
  }
}
