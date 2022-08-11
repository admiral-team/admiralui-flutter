enum ControlState {
  normal,
  highlighted,
  disabled,
  selected,
}

class ControlParameter<T> {
  Map<String, T> _parameters = {};

  void set(T parameter, ControlState forState) {
    _parameters[forState.name] = parameter;
  }

  T? paramter(ControlState forState) {
    return _parameters[forState.name];
  }
}
