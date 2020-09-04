import 'dart:convert';

import 'package:http/http.dart' as client;
import 'package:mobiletest/models/user_model.dart';
class APIProvider {
  String _url = 'http://192.168.100.249:3000';
  String failed = 'Gagal';

  Future getUserDetail(String username, String password) async {
    final response = await client.put('$_url/todolist/users/' + username);
    if(response.statusCode == 200) {
      var res = User.fromJson(json.decode(response.body));
      print(res);
      return res;
    } else {
      throw Exception('Failed Login');
    }
  }

  Future createUser(username, pass, timestamp) async {
    final response = await client.post("$_url/users/create",
    body: {'username': username,'password': pass,'timestamp': timestamp, 'login_state': 'false'});
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to add data');
    }
  }

  Future logOutUser(username) async {
    final response = await client.put("$_url/logout/" + username, body: {'login_state': "false"});
    if (response.statusCode == 200) {
      print('berhasil di update');
      return response;
    } else {
      throw Exception('Failed to update data');
    }
  }
}