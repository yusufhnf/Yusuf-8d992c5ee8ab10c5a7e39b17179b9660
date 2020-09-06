import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:mobiletest/configs/shared_preference.dart';
import 'package:mobiletest/services/api_provider.dart';
import 'package:mobiletest/utils/time_format.dart';
import 'package:stacked/stacked.dart';
import 'package:toast/toast.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  String _imeiNumber;
  TimeFormat time;
  APIProvider api = APIProvider();
  var apiLogin;

  Future initial() async {
    setBusy(true);
    updateIMEI();
    setBusy(false);
    notifyListeners();
  }

  Future loginGo(BuildContext context) async {
    setBusy(true);
    print("==IMEI: $_imeiNumber");
    apiLogin = await api.loginUser(etUsername.text, etPassword.text, _imeiNumber,
        time.formatDateTime(DateTime.now()));
    apiLogin != null ? navigateHome(context) : Toast.show("Username atau Password Salah", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    setBusy(false);
  }

  Future updateIMEI() async {
    _imeiNumber = await ImeiPlugin.getImei();
  }

  void navigateRegister(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void navigateHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}
