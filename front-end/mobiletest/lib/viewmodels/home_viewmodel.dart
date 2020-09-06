import 'dart:async';
import 'package:intl/intl.dart';
import 'package:mobiletest/configs/shared_preference.dart';
import 'package:mobiletest/utils/time_format.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _timeString;
  String _isUserLogin;
  TimeFormat time = TimeFormat();

  get timeString => _timeString;
  get isUserLogin => _isUserLogin;

  Future initial() async {
    _timeString = time.formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    setBusy(true);
    _isUserLogin = await UserSharedPreference.getUser();
    setBusy(false);
    notifyListeners();
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = time.formatDateTime(now);
    _timeString = formattedDateTime;
    notifyListeners();
  }

}
