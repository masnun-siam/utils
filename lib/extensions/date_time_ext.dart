extension NullableDateTimeExt on DateTime? {
  DateTime validate([DateTime? fallback]) => this ?? fallback ?? DateTime.now();
}

extension DateTimeExt on DateTime {
  int get hourOfPeriod => hour % 12;
  String get period => hour < 12 ? 'AM' : 'PM';
  // get HH:mm format
  String get toShortTimeString =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  // get jj:mm pp format
  String get toShortTimeString12 =>
      '${hourOfPeriod.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';

  bool isBeforeNow() => isBefore(DateTime.now());

  bool isAfterNow() => isAfter(DateTime.now());

  String timeAgo() {
    final diff = DateTime.now().difference(this);
    if (diff.inDays > 365) {
      final years = (diff.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    } else if (diff.inDays > 30) {
      final months = (diff.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else if (diff.inDays > 7) {
      final weeks = (diff.inDays / 7).floor();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    } else if (diff.inDays > 0) {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} minute${diff.inMinutes > 1 ? 's' : ''} ago';
    } else if (diff.inSeconds > 0) {
      return '${diff.inSeconds} second${diff.inSeconds > 1 ? 's' : ''} ago';
    } else {
      return 'just now';
    }
  }
}
