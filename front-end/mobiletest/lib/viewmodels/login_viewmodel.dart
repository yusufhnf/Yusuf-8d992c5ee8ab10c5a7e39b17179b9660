import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobiletest/configs/shared_preference.dart';
import 'package:mobiletest/services/api_provider.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  TextEditingController etUsername = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  
  APIProvider api = APIProvider();
  Future initial() async {
    notifyListeners();
  }

  Future loginGo() async {
    setBusy(true);
    await api.getUserDetail(etUsername.text, etPassword.text);
    await UserSharedPreference.setUser(etUsername.text);
    setBusy(false);
  }
  
}
