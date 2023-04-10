enum ControlState {
  normal,
  highlighted,
  disabled,
  selected,
}

class ControlParameter<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, ControlState forState) {
    _parameters[forState.name] = parameter;
  }

  T? parameter(ControlState forState) {
    return _parameters[forState.name];
  }

  T unsafeParameter(ControlState forState) {
    final T? result = _parameters[forState.name];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${forState.name}' is undeclared in the "
          'ControlState.';
    }
  }
}
