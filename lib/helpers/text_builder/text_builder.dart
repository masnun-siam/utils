// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextWidgetBuilder {
  String text;
  String? fontFamily;
  double? fontSize;
  Color? color;
  FontWeight? fontWeight;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLines;
  double? letterSpacing;
  double? wordSpacing;
  double? height;
  TextDecoration? decoration;
  Color? decorationColor;
  TextDecorationStyle? decorationStyle;
  double? decorationThickness;

  TextWidgetBuilder({
    required this.text,
    this.fontFamily,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
  });

  void set({
    String? text,
    String? fontFamily,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    double? wordSpacing,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
  }) {
    this
      ..text = text ?? this.text
      ..fontFamily = fontFamily ?? this.fontFamily
      ..fontSize = fontSize ?? this.fontSize
      ..color = color ?? this.color
      ..fontWeight = fontWeight ?? this.fontWeight
      ..fontStyle = fontStyle ?? this.fontStyle
      ..textAlign = textAlign ?? this.textAlign
      ..textOverflow = textOverflow ?? this.textOverflow
      ..maxLines = maxLines ?? this.maxLines
      ..letterSpacing = letterSpacing ?? this.letterSpacing
      ..wordSpacing = wordSpacing ?? this.wordSpacing
      ..height = height ?? this.height
      ..decoration = decoration ?? this.decoration
      ..decorationColor = decorationColor ?? this.decorationColor
      ..decorationStyle = decorationStyle ?? this.decorationStyle
      ..decorationThickness = decorationThickness ?? this.decorationThickness;
  }

  Widget build() {
    return Material(
      color: Colors.transparent,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          overflow: textOverflow,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          height: height,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
        ),
      ),
    );
  }
}
