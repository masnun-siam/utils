extension NullableListExt on List? {
  List<T> validate<T>([List<T> fallback = const []]) => this?.cast<T>() ?? fallback;
}

extension ListExt<T> on List<T> {
  void addIf(bool condition, T element) {
    if (condition) add(element);
  }

  void addAllIf(bool condition, Iterable<T> elements) {
    if (condition) addAll(elements);
  }

  void addAllNotNull(Iterable<T?> elements) {
    addAll(elements.whereType<T>());
  }

  void forEachIndexed(void Function(int index, T element) action) {
    for (var i = 0; i < length; i++) {
      action(i, this[i]);
    }
  }

  List<T> filter(bool Function(T element) test) => where(test).toList();

  List<T> filterNot(bool Function(T element) test) => where((e) => !test(e)).toList();

  List<T> filterNotNull() => whereType<T>().toList();

  List<T> filterIndexed(bool Function(int index, T element) test) {
    final result = <T>[];
    forEachIndexed((index, element) {
      if (test(index, element)) result.add(element);
    });
    return result;
  }

  List<T> mapIndexed(T Function(int index, T element) transform) {
    final result = <T>[];
    forEachIndexed((index, element) {
      result.add(transform(index, element));
    });
    return result;
  }
}