import 'dart:ui';

extension ColorExt on Color {
  Color get withOpacityHalf => withOpacity(0.5);
  Color get o1 => withOpacity(0.1);
  Color get o2 => withOpacity(0.2);
  Color get o3 => withOpacity(0.3);
  Color get o4 => withOpacity(0.4);
  Color get o5 => withOpacity(0.5);
  Color get o6 => withOpacity(0.6);
  Color get o7 => withOpacity(0.7);
  Color get o8 => withOpacity(0.8);
  Color get o9 => withOpacity(0.9);

  // is light
  bool get isLight => computeLuminance() > 0.5;

  // invert
  Color get invertColor => Color(0xFFFFFFFF - value);
}