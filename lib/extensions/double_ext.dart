import 'package:flutter/widgets.dart';

extension NullableDoubleExt on double? {
  double validate([double fallback = 0.0]) => this ?? fallback;
}

extension DoubleExt on double {
  Widget get height => SizedBox(height: this);
  Widget get width => SizedBox(width: this);
  Widget get square => SizedBox(width: this, height: this);

  Size get squareSize => Size(this, this);
}
