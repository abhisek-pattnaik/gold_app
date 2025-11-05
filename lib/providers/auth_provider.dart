import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;


  bool get passwordVisible => _passwordVisible;
  void setPasswordVisible(bool value) {
    _passwordVisible = value;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
