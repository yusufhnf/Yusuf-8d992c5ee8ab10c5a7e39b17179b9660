// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.username,
        this.password,
        this.loginTime,
        this.loginState,
    });

    String username;
    String password;
    int loginTime;
    String loginState;

    factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
        loginTime: json["login_time"],
        loginState: json["login_state"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "login_time": loginTime,
        "login_state": loginState,
    };
}
