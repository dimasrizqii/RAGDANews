import 'package:flutter/material.dart';
import 'package:RAGDANews/models/user_model.dart';
import 'package:RAGDANews/ui/login/login_view_model.dart';

class ProfileViewModel with ChangeNotifier {
  final UserModel _user = UserModel(
    name: 'Hasan Waulat',
    job: 'Departemen A',
    profileImage: 'assets/images/Avatar.jpg',
  );

  UserModel get user => _user;

  Future<void> logout(BuildContext context) async {
    final loginVM = LoginViewModel();
    await loginVM.clearSession();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
