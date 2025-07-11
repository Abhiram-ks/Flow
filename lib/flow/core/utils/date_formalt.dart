import 'package:intl/intl.dart';

class DateFormatter {
  static String formatTimestamp(DateTime timestamp) {
    return DateFormat('dd MMM yyyy').format(timestamp);
  }
}