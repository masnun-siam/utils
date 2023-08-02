import 'package:flutter/widgets.dart';

extension NullableIntExt on int? {
  int validate([int fallback = 0]) => this ?? fallback;
  double toDouble([double fallback = 0.0]) => (this ?? 0).toDouble();
}

extension IntExt on int {
  String get toCurrency =>
      '\$${toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},')}';
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
  Duration get weeks => Duration(days: this * 7);
  Duration get months => Duration(days: (this * 365.25 / 12).round());
  Duration get milliSeconds => Duration(milliseconds: this);
  Duration get microSeconds => Duration(microseconds: this);
  // delay
  Future<void> get delaySeconds => Future.delayed(seconds);
  Future<void> get delayMinutes => Future.delayed(minutes);
  Future<void> get delayHours => Future.delayed(hours);
  Future<void> get delayMilliseconds => Future.delayed(milliSeconds);

  bool isValidHttpRequestStatusCode() => this >= 100 && this < 600;
  bool isValidHttpResponseStatusCode() => this >= 200 && this < 600;
  bool isValidHttpStatusCode() => isValidHttpRequestStatusCode() || isValidHttpResponseStatusCode();
  bool isSuccess() => this >= 200 && this < 300;

  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
  Widget get square => SizedBox(width: toDouble(), height: toDouble());

  Size get squareSize => Size(toDouble(), toDouble());
}
