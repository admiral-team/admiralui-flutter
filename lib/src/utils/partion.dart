import 'dart:collection';

Iterable<List<T>> partition<T>(Iterable<T> iterable, int size) {
  return iterable.isEmpty ? <List<T>>[] : _Partition<T>(iterable, size);
}

class _Partition<T> extends IterableBase<List<T>> {
  _Partition(this._iterable, this._size) {
    if (_size <= 0) throw ArgumentError(_size);
  }

  final Iterable<T> _iterable;
  final int _size;

  @override
  Iterator<List<T>> get iterator =>
      _PartitionIterator<T>(_iterable.iterator, _size);
}

class _PartitionIterator<T> implements Iterator<List<T>> {
  _PartitionIterator(this._iterator, this._size);

  final Iterator<T> _iterator;
  final int _size;
  List<T>? _current;

  @override
  List<T> get current {
    // ignore: cast_nullable_to_non_nullable
    return _current as List<T>;
  }

  @override
  bool moveNext() {
    final List<T> newValue = <T>[];
    int count = 0;
    while (count < _size && _iterator.moveNext()) {
      newValue.add(_iterator.current);
      count++;
    }
    _current = (count > 0) ? newValue : null;
    return _current != null;
  }
}
