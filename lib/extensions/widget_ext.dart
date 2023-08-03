import 'package:flutter/material.dart';

extension NullableWidgetExt on Widget? {
  Widget validate([Widget fallback = const SizedBox.shrink()]) =>
      this ?? fallback;
}

extension WidgetExt on Widget {
  Widget pLeft(double value) =>
      Padding(padding: EdgeInsets.only(left: value), child: this);

  Widget pRight(double value) =>
      Padding(padding: EdgeInsets.only(right: value), child: this);

  Widget pTop(double value) =>
      Padding(padding: EdgeInsets.only(top: value), child: this);

  Widget pBottom(double value) =>
      Padding(padding: EdgeInsets.only(bottom: value), child: this);

  Widget p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Widget px(double value) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: value), child: this);

  Widget py(double value) =>
      Padding(padding: EdgeInsets.symmetric(vertical: value), child: this);

  Widget circle() => ClipOval(child: this);

  Widget rounded(double value) => ClipRRect(
        borderRadius: BorderRadius.circular(value),
        child: this,
      );

  // shadow
  Widget shadow(
          {Color color = Colors.black,
          double blurRadius = 10,
          double spreadRadius = 0,
          (double, double) offset = (0, 0)}) =>
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: blurRadius,
              spreadRadius: spreadRadius,
              offset: Offset(offset.$1, offset.$2),
            ),
          ],
        ),
        child: this,
      );
  
  // border
  Widget border(
          {Color color = Colors.black,
          double width = 1,
          double radius = 0}) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: width,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: this,
      );
  
  // center
  Widget center() => Center(child: this);

}
