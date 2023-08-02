extension DurationExt on Duration {
  String get toShortString {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    final milliseconds = inMilliseconds.remainder(1000);
    final microseconds = inMicroseconds.remainder(1000);
    final parts = <String>[];
    if (hours > 0) parts.add('${hours}h');
    if (minutes > 0) parts.add('${minutes}m');
    if (seconds > 0) parts.add('${seconds}s');
    if (milliseconds > 0) parts.add('${milliseconds}ms');
    if (microseconds > 0) parts.add('$microsecondsμs');
    return parts.join(' ');
  }

  Future<void> get delay => Future.delayed(this);

  bool get isNegative => inMicroseconds < 0;

  bool get isPositive => inMicroseconds > 0;

  bool get isZero => inMicroseconds == 0;

  Duration operator +(Duration other) => Duration(microseconds: inMicroseconds + other.inMicroseconds);

  Duration operator -(Duration other) => Duration(microseconds: inMicroseconds - other.inMicroseconds);

  Duration operator *(num factor) => Duration(microseconds: (inMicroseconds * factor).round());

  Duration operator ~/(num quotient) => Duration(microseconds: (inMicroseconds ~/ quotient));

  Duration operator %(Duration other) => Duration(microseconds: inMicroseconds % other.inMicroseconds);

  Duration abs() => Duration(microseconds: inMicroseconds.abs());

}
