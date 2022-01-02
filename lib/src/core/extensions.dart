extension DateTimeExtensions on DateTime {
  DateTime withoutTime() => DateTime(year, month, day);
  operator >(DateTime other) => compareTo(other) > 0;
  operator <(DateTime other) => compareTo(other) < 0;
  operator <=(DateTime other) => compareTo(other) <= 0;
  operator >=(DateTime other) => compareTo(other) >= 0;
}
