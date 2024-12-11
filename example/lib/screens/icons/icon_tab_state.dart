enum IconTabState {
  outline,
  solid;

  String get value {
    switch (this) {
      case IconTabState.outline:
        return 'outline';
      case IconTabState.solid:
        return 'solid';
    }
  }
}
