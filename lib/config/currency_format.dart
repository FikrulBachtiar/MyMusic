import 'package:intl/intl.dart';

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
    String currencyFormmatter = DateFormat(format).format(
      DateTime.parse(date).toLocal(),
    );
    return currencyFormmatter.toString();
  }
}
