import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../model/user.dart';

class UserRepository with ChangeNotifier {
  static final String url = 'http://coursatk.jodeveloper.com';
  static String token;
  static Future<String> authenticate({
    @required String phone,
    @required String password,
  }) async {
    var response = await http.post('$url/api/user/login',
        headers: {'Accept': 'application/json'},
        body: {'phone': phone, 'password': password});
    var data = json.decode(response.body);
    var userBox = await Hive.openBox('user');
    userBox.put('token', data["api_token"] as String);
    userBox.put('image', data["image"]);
    userBox.put('address', data["address"]);
    userBox.put('email', data["email"]);
    userBox.put('name', data["name"]);
    persistToken(userBox.get("token"));
    return data["api_token"];
  }

  static Future<User> signup(
      {String address,
      String phone,
      String password,
      String name,
      String email,
      String passwordConfirmation}) async {
    var response = await http.post('$url/api/user/sigin',
        headers: {'Accept': 'application/json'},
        body: {'phone': phone, 'password': password});
    var data = json.decode(response.body);
    var user = User.fromJson(data);
    print(user.toString());
    return user;
  }

  static Future<void> deleteToken() async {
    var userBox = await Hive.openBox('user');
    userBox.delete('token');
    userBox.close();
    return;
  }

  static Future<void> persistToken(String _token) async {
    var userBox = await Hive.openBox('user');
    userBox.put('token', _token);
    token = _token;
    userBox.close();
  }

  static bool hasToken() {
    print("token = $token");
    return token == null;
  }

  static Future<String> getUserName() async {
    var userBox = await Hive.openBox('user');
    String userName = userBox.get('name');
    userBox.close();
    return userName;
  }

  static Future<String> getUserEmail() async {
    var userBox = await Hive.openBox('user');
    String userName = userBox.get('email');
    userBox.close();
    return userName;
  }
}
