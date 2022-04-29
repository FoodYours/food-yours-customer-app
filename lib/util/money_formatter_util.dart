import 'package:intl/intl.dart';

import '../resources/strings.dart';

class MoneyFormatterUtil {
  static String format(final String amount) {
    String normalizedAmount = normalize(amount);

    return NumberFormat("#,##0.00", Strings.LOCALE)
        .format(double.parse(normalizedAmount));
  }

  static String normalize(final String amount) {
    return amount.replaceAll(",", "");
  }
}
