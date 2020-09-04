import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  Future initial() async {
    setBusy(true);
    // user = await api.listUser();
    setBusy(false);
    notifyListeners();
  }
}