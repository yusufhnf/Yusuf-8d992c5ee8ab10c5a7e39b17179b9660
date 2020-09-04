import 'dart:async';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _timeString;

  get timeString => _timeString;

  Future initial() async {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    notifyListeners();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    _timeString = formattedDateTime;
    notifyListeners();
  }

  // HH:mm:ss
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }
}
