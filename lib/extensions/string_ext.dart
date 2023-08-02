import 'dart:convert';
import 'dart:ui';

import 'package:utils/helpers/html_character_entities.dart';
import 'package:utils/helpers/text_builder.dart';

extension NullableStringExt on String? {
  String validate([String fallback = '']) => this ?? fallback;
  double toDouble([double fallback = 0.0]) =>
      double.tryParse(this ?? '') ?? fallback;
  int toInt([int fallback = 0]) => int.tryParse(this ?? '') ?? fallback;
  bool get isNotEmptyOrNull => this != null && this!.isNotEmpty;
  bool get isEmptyOrNull => this == null || this!.isEmpty;
  bool get isNotNull => this != null;
  bool get isNull => this == null;
}

extension StringExt on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
  String get camelCase => split(' ').map((e) => e.capitalize).join('');
  String get snakeCase => split(' ').map((e) => e.toLowerCase()).join('_');

  String get validateHex => startsWith('#') ? this : '#$this';

  Color get hexToColor => Color(int.parse('0xFF${validateHex.substring(1)}'));

  String get capitalizeFirstLetter => '${this[0].toUpperCase()}${substring(1)}';

  bool get isEmail =>
      RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]').hasMatch(this);
  bool get isPhone => RegExp(
          r'\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}')
      .hasMatch(this);
  bool get isStrongPassword =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(this);
  bool get isUrl => RegExp(
          r'^(?:http|https):\/\/[\w\-_]+(?:\.[\w\-_]+)+(?:[\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?$')
      .hasMatch(this);
  bool get isValidJson {
    try {
      jsonDecode(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  TextWidgetBuilder get textBuilder => TextWidgetBuilder(text: this);

  Map<String, dynamic> decodeJson() {
    try {
      return jsonDecode(this);
    } catch (e) {
      return {};
    }
  }

  String get toBase64 => base64Encode(utf8.encode(this));
  String get fromBase64 => String.fromCharCodes(base64Decode(this));

  Uri get toUri => Uri.parse(this);

  // html decode
  String decodeHtmlCharacters() => HtmlCharacterEntities.decode(this);
}
