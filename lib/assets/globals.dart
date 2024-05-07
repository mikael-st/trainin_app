class Globals {
  static DateTime? today;
  static final List<int> _days = [
    DateTime.sunday,
    DateTime.monday,
    DateTime.tuesday,
    DateTime.wednesday,
    DateTime.thursday,
    DateTime.friday,
    DateTime.saturday,
  ]; 

  static setToday(DateTime day) {
    today ??= day;
  }

  static int getToday() {
    for (var day in _days) {
      if (today!.weekday == day) {
        return _days.indexOf(day);
      }
    }
    return 0;
  }
}

/**
 * Dom:  0
 * Seg:  1
 * Ter:  2
 * Quar: 3
 * Quin: 4
 * Sex:  5
 * Sab:  6
 */