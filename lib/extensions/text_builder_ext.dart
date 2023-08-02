import 'package:flutter/material.dart';
import 'package:utils/helpers/text_builder/text_builder.dart';

extension TextBuilderExt on TextWidgetBuilder {
  TextWidgetBuilder get x8 => this..fontSize = 8;
  TextWidgetBuilder get x10 => this..fontSize = 10;
  TextWidgetBuilder get x12 => this..fontSize = 12;
  TextWidgetBuilder get x14 => this..fontSize = 14;
  TextWidgetBuilder get x16 => this..fontSize = 16;
  TextWidgetBuilder get x18 => this..fontSize = 18;
  TextWidgetBuilder get x20 => this..fontSize = 20;
  TextWidgetBuilder get x22 => this..fontSize = 22;
  TextWidgetBuilder get x24 => this..fontSize = 24;
  TextWidgetBuilder get x26 => this..fontSize = 26;
  TextWidgetBuilder get x28 => this..fontSize = 28;
  TextWidgetBuilder get x30 => this..fontSize = 30;
  TextWidgetBuilder get x32 => this..fontSize = 32;
  TextWidgetBuilder get x34 => this..fontSize = 34;

  TextWidgetBuilder get bold => this..fontWeight = FontWeight.bold;
  TextWidgetBuilder get italic => this..fontStyle = FontStyle.italic;
  TextWidgetBuilder get center => this..textAlign = TextAlign.center;
  TextWidgetBuilder get left => this..textAlign = TextAlign.left;
  TextWidgetBuilder get right => this..textAlign = TextAlign.right;
  TextWidgetBuilder get justify => this..textAlign = TextAlign.justify;
  TextWidgetBuilder get underline =>
      this..decoration = TextDecoration.underline;
  TextWidgetBuilder get lineThrough =>
      this..decoration = TextDecoration.lineThrough;
  TextWidgetBuilder get overline =>
      this..decoration = TextDecoration.overline;

  TextWidgetBuilder get white => this..color = Colors.white;
  TextWidgetBuilder get black => this..color = Colors.black;
  TextWidgetBuilder get red => this..color = Colors.red;
  TextWidgetBuilder get green => this..color = Colors.green;
  TextWidgetBuilder get blue => this..color = Colors.blue;
  TextWidgetBuilder get yellow => this..color = Colors.yellow;
  TextWidgetBuilder get orange => this..color = Colors.orange;
  TextWidgetBuilder get purple => this..color = Colors.purple;
  TextWidgetBuilder get pink => this..color = Colors.pink;
  TextWidgetBuilder get teal => this..color = Colors.teal;
  TextWidgetBuilder get cyan => this..color = Colors.cyan;
  TextWidgetBuilder get brown => this..color = Colors.brown;
  TextWidgetBuilder get grey => this..color = Colors.grey;
  TextWidgetBuilder get indigo => this..color = Colors.indigo;
  TextWidgetBuilder get amber => this..color = Colors.amber;
  TextWidgetBuilder get lime => this..color = Colors.lime;
  TextWidgetBuilder get lightBlue => this..color = Colors.lightBlue;
  TextWidgetBuilder get lightGreen => this..color = Colors.lightGreen;
  TextWidgetBuilder get deepOrange => this..color = Colors.deepOrange;
  TextWidgetBuilder get deepPurple => this..color = Colors.deepPurple;
  TextWidgetBuilder get blueGrey => this..color = Colors.blueGrey;
  TextWidgetBuilder get cyanAccent => this..color = Colors.cyanAccent;
  TextWidgetBuilder get redAccent => this..color = Colors.redAccent;
  TextWidgetBuilder get greenAccent => this..color = Colors.greenAccent;
  TextWidgetBuilder get blueAccent => this..color = Colors.blueAccent;
  TextWidgetBuilder get yellowAccent => this..color = Colors.yellowAccent;
  TextWidgetBuilder get orangeAccent => this..color = Colors.orangeAccent;

  TextWidgetBuilder get w1 => this..fontWeight = FontWeight.w100;
  TextWidgetBuilder get w2 => this..fontWeight = FontWeight.w200;
  TextWidgetBuilder get w3 => this..fontWeight = FontWeight.w300;
  TextWidgetBuilder get w4 => this..fontWeight = FontWeight.w400;
  TextWidgetBuilder get w5 => this..fontWeight = FontWeight.w500;
  TextWidgetBuilder get w6 => this..fontWeight = FontWeight.w600;
  TextWidgetBuilder get w7 => this..fontWeight = FontWeight.w700;
  TextWidgetBuilder get w8 => this..fontWeight = FontWeight.w800;
  TextWidgetBuilder get w9 => this..fontWeight = FontWeight.w900;

  TextWidgetBuilder get italicBold =>
      this..fontStyle = FontStyle.italic..fontWeight = FontWeight.bold;
  
  TextWidgetBuilder get caption {
    return this
      ..fontSize = 12
      ..fontWeight = FontWeight.w400
      ..fontStyle = FontStyle.normal
      ..color = Colors.black;
  }

  TextWidgetBuilder get title {
    return this
      ..fontSize = 16
      ..fontWeight = FontWeight.w500
      ..fontStyle = FontStyle.normal
      ..color = Colors.black;
  }

  TextWidgetBuilder get subtitle {
    return this
      ..fontSize = 14
      ..fontWeight = FontWeight.w400
      ..fontStyle = FontStyle.normal
      ..color = Colors.black;
  }


}