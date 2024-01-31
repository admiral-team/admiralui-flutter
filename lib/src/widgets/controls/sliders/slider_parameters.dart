// ignore_for_file: avoid_positional_boolean_parameters
class SliderParameters<T> {
  final Map<String, T> _parameters = <String, T>{};
  
  void set(T parameter, bool isEnabled) {
    _parameters[key(isEnabled)] = parameter;
  }

  T? parameter(bool isEnabled) {
    return _parameters[key(isEnabled)];
  }

  String key(bool isEnabled) {
    return isEnabled.toString();
  }

  T unsafeParameter(bool isEnabled) {
    final T? result = _parameters[key(isEnabled)];
    if (result != null) {
      return result;
    } else {
      throw "Parameter with the name '${key(isEnabled)}' "
          'is undeclared in the ControlState.';
    }
  }
}
