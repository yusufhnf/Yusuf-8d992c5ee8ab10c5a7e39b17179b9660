import 'package:intl/intl.dart';

class TimeFormat {

  // HH:mm:ss
  String formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}