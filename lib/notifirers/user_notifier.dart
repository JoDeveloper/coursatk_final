import 'package:flutter/cupertino.dart';

import '../repository/user_repository.dart';

class UserNotifier with ChangeNotifier {
  Status loginStatus;
  void loginLoading() {
    this.loginStatus = Status.running;
    notifyListeners();
  }

  void loginLoaded() {
    this.loginStatus = Status.stopped;
    notifyListeners();
  }

  bool login(String phone, String password) {
    this.loginLoading();
    UserRepository.authenticate(phone: phone, password: password);
    this.loginLoaded();
    return UserRepository.hasToken();
  }

  bool isLoggedIn() {
    return UserRepository.hasToken();
  }
}

enum Status { none, running, stopped }
