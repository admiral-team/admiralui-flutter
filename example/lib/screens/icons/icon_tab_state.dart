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

  String get title {
    switch (this) {
      case IconTabState.outline:
        return 'Outline';
      case IconTabState.solid:
        return 'Solid';
    }
  }

  String get filterValue {
    switch (this) {
      case IconTabState.outline:
        return 'Outline';
      case IconTabState.solid:
        return 'Solid';
    }
  }
}
