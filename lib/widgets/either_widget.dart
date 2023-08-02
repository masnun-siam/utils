import 'package:flutter/material.dart';

class EitherWidget extends StatelessWidget {
  const EitherWidget({super.key, required this.condition, required this.left, required this.right});

  final bool condition;
  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) {
    return condition ? left : right;
  }
}
