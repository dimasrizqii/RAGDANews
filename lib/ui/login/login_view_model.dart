import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends ChangeNotifier {
  String? emailError;
  String? passwordError;
  bool isLoading = false;

  Future<bool> login(String email, String password) async {
    emailError = null;
    passwordError = null;
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    const validEmail = 'dimas@gmail.com';
    const validPassword = 'ragdalion';

    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);

    if (email.isEmpty) {
      emailError = 'Please enter your email';
    } else if (!emailValid) {
      emailError = 'Please check your email again';
    }

    if (password.isEmpty) {
      passwordError = 'Please enter your password';
    }

    if (emailError != null || passwordError != null) {
      isLoading = false;
      notifyListeners();
      return false;
    }

    if (email != validEmail) {
      emailError = 'Email is not registered';
      isLoading = false;
      notifyListeners();
      return false;
    }

    if (password.length < 8) {
      passwordError = 'The password must be at least 8 characters long';
      isLoading = false;
      notifyListeners();
      return false;
    }

    if (password != validPassword) {
      passwordError = 'Incorrect password';
      isLoading = false;
      notifyListeners();
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', true);

    isLoading = false;
    notifyListeners();
    return true;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in') ?? false;
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('is_logged_in');
  }
}
