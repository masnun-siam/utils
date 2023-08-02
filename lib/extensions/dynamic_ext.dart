extension DynamicExt on dynamic {
  bool get isNull => this == null;
  bool get isNotNull => this != null;

  bool get isBool => this is bool;
  bool get isNotBool => this is! bool;

  bool get isNum => this is num;
  bool get isNotNum => this is! num;

  bool get isString => this is String;
  bool get isNotString => this is! String;

  bool get isList => this is List;
  bool get isNotList => this is! List;

  bool get isMap => this is Map;
  bool get isNotMap => this is! Map;
}