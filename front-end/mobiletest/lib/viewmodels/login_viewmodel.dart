import 'dart:async';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  Future initial() async {
    setBusy(true);
    // user = await api.listUser();
    setBusy(false);
    notifyListeners();
  }
  
}
