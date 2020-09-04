import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobiletest/services/api_provider.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  APIProvider api = APIProvider();
  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  TextEditingController etRepeatPassword = new TextEditingController();

  String _timeString;

  get timeString => _timeString;

  Future createUser() async {
    setBusy(true);
    await api.createUser(etUsername.text, etPassword.text, timeString);
    setBusy(false);
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
