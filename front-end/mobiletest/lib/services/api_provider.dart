import 'package:http/http.dart' as client;
import 'package:mobiletest/models/user_model.dart';
class APIProvider {
  String _url = 'http://192.168.100.249:3000';

  Future<List<User>> getUserDetail(String id) async {
    final response = await client.put('$_url/todolist/users/' + id);
    if(response.statusCode == 200) {
      var res = userFromJson(response.body);
      print(res);
      return res;
    }
  }

  Future createUser(username, pass, timestamp) async {
    final response = await client.post("$_url/users/create",
    body: {'username': username,'password': pass,'timestamp': timestamp});
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