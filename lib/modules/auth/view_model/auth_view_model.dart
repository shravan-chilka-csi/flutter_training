import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';

const usernameKey = 'username_key';
const passwordKey = 'password_key';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isAuthenticated() {
    if (sharedPreferences.containsKey(usernameKey) &&
        sharedPreferences.containsKey(passwordKey)) {
      return true;
    } else {
      return false;
    }
  }

  void loginClickEvent() async {
    final username = usernameController.text;
    final password = passwordController.text;

    await sharedPreferences.setString(usernameKey, username);
    await sharedPreferences.setString(passwordKey, password);
    notifyListeners();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void clearData() async {
    await sharedPreferences.clear();
    notifyListeners();
  }
}
