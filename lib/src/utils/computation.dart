Duration diff(DateTime now, DateTime end) {
  return Duration(
    days: end.difference(now).inDays,
    hours: end.difference(now).inHours,
    minutes: end.difference(now).inMinutes,
    seconds: end.difference(now).inSeconds,
  );
}

String durationToString(Duration duration) {
  final days = duration.inDays;
  final hours = duration.inHours.remainder(24);
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  if (days > 0) {
    return '$days days $hours hours left';
  } else if (hours > 0) {
    return '$hours hours $minutes minutes left';
  } else if (minutes > 0) {
    return '$minutes minutes $seconds seconds left';
  } else {
    return '$seconds seconds left';
  }
}

double getProgress(DateTime now, DateTime start, Duration end) {
  final total = end.inSeconds;
  final passed = now.difference(start).inSeconds;
  return passed / total;
}

String mapMonth(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}

String getTimeline(DateTime startDate, Duration duration) {
  final end = startDate.add(duration);
  return '${mapMonth(startDate.month)} ${startDate.day} to ${mapMonth(end.month)} ${end.day}';
}