import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '');

  User get user => _user;

  void setUser(String user) {
    //* Passing in String as a user as the response we get is a string
    _user = User.fromJson(user);
    notifyListeners();
  }
}
