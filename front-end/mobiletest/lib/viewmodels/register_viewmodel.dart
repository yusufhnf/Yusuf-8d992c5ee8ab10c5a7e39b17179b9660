import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobiletest/services/api_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:toast/toast.dart';

class RegisterViewModel extends BaseViewModel {
  APIProvider api = APIProvider();
  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  TextEditingController etRepeatPassword = new TextEditingController();

  String _timeString;

  get timeString => _timeString;

  Future createUser(BuildContext context) async {
    setBusy(true);
    if (etPassword.text == etRepeatPassword.text) {
      api = await api.createUser(etUsername.text, etPassword.text);
      api != null ? navigateLogin(context) : Toast.show("Login tidak Berhasil", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    } else {
      Toast.show("Password tidak sama", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    }
    setBusy(false);
    notifyListeners();
  }

  void navigateLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
