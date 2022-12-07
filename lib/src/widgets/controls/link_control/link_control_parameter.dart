enum LinkStyle {
  normal,
  medium
}

class LinkControlParameter<T> {
  final Map<String, T> _parameters = <String, T>{};

  void set(T parameter, LinkStyle forState) {
    _parameters[forState.name] = parameter;
  }

  T? parameter(LinkStyle forState) {
    return _parameters[forState.name];
  }

  T unsafeParameter(LinkStyle forState) {
    final T? result = _parameters[forState.name];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${forState.name}' is undeclared in the "
          'ControlState.';
    }
  }
}