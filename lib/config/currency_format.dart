import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit, String simbol) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: simbol,
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }

  static String convertToDate(String date, String format) {
    String currencyFormatter = DateFormat(format).format(
      DateTime.parse(date).toLocal(),
    );
    return currencyFormatter.toString();
  }

  static String convertToDifferentDate(DateTime? date) {
    final now = LocalDate.dateTime(DateTime.now());
    final dates = LocalDate.dateTime(date ?? DateTime.now());
    Period diff = now.periodSince(dates);

    if (diff.minutes != 0) {
      return '${diff.minutes} menit yang lalu';
    } else if (diff.days != 0) {
      return '${diff.days} hari yang lalu';
    } else if (diff.months != 0) {
      return '${diff.months} bulan yang lalu';
    } else {
      return '${diff.years} tahun yang lalu';
    }
  }

  static String convertToAbbreviation(String number) {
    if (number.length == 4) {
      return '${number[0].toString().toLowerCase()} rb';
    } else if (number.length == 5) {
      return '${number[0].toString()}${number[1].toString()} rb';
    } else if (number.length == 6) {
      return '${number[0].toString()}${number[1].toString()}${number[2].toString()} rb';
    } else if (number.length == 7) {
      return '${number[0].toString()},${number[1].toString()} jt';
    } else {
      return '$number rb';
    }
  }
}
