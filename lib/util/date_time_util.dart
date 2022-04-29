import 'package:flutter/src/material/time.dart';
import 'package:food_yours_customer/resources/strings.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  static TimeOfDay dateTimeToTimeOfDay(DateTime? dateTime) =>
      TimeOfDay.fromDateTime(dateTime ?? DateTime.now());

  static DateTime stringToDateTime(String dateTimeString) =>
      DateFormat('d/M/yyyy').parse(dateTimeString);

  static String dateTimeToDayOfWeek(DateTime? dateTime) =>
      DateFormat('EEEE').format(dateTime ?? DateTime.now());

  static DateTime timeOfDayToDateTime(TimeOfDay timeOfDay) {
    DateTime now = new DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  static String dateTimeToString([DateTime? dateTime, String? formatString]) {
    final DateFormat formatter =
        DateFormat(formatString ?? Strings.DAY_MONTH_YEAR_HOUR_MINUTE_PM);
    return formatter.format(dateTime!);
  }
}
