extension DateTimeExtensions on DateTime {
  DateTime withoutTime() => DateTime(year, month, day);
  DateTime addYears(int years) => DateTime(year + years, month, day);
  DateTime removeYears(int years) => DateTime(year - years, month, day);
  operator >(DateTime other) => compareTo(other) > 0;
  operator <(DateTime other) => compareTo(other) < 0;
  operator <=(DateTime other) => compareTo(other) <= 0;
  operator >=(DateTime other) => compareTo(other) >= 0;
}
