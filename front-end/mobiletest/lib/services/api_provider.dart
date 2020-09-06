import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:mobiletest/configs/shared_preference.dart';
import 'package:mobiletest/models/user_model.dart';

class APIProvider {
  //Change IP Address
  String _url = 'http://192.168.1.104:3000';
  String failed = 'Gagal';

  Future<User> loginUser(
      String username, String password, String imei, String time) async {
    final response = await client.post('$_url/userstest/users/login', body: {
      'username': username,
      'password': password,
      'login_time': time,
      'login_state': imei
    });

    if (response.statusCode == 200) {
      print(response.body);
      var res = User.fromJson(json.decode(response.body));
      if (res.username != null) {
        // await UserSharedPreference.setUser(res.username);
        print(res);
        print("=== Isi Username: " + UserSharedPreference.getUser().toString());
        return res;
      } else {
        return null;
      }
    } else {
      print("Gagal Login");
      return null;
      // throw Exception('Failed Login');
    }
  }

  Future createUser(username, pass) async {
    final response = await client.post("$_url/userstest/users/create", body: {
      'username': username,
      'password': pass,
    });
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  Future logOutUser(username) async {
    final response = await client
        .put("$_url/userstest/users/logout", body: {'username': username});
    if (response.statusCode == 200) {
      print('berhasil di update');
      return response;
    } else {
      // throw Exception('Failed to update data');
      return null;
    }
  }
}
