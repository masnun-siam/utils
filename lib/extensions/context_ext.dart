import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get height => size.height;
  double get width => size.width;
  double get percentHeight => height / 100;
  double get percentWidth => width / 100;
  bool isDarkTheme() => Theme.of(this).brightness == Brightness.dark;
  double get bottomInset => MediaQuery.maybeViewInsetsOf(this)?.bottom ?? 0;
}
