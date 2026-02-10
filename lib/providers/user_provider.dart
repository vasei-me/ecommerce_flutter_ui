import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel(
    id: '1',
    fullName: 'Erfan',
    email: 'erfan@email.com',
    phone: '09123456789',
  );

  UserModel get user => _user;

  void updateProfile({
    required String fullName,
    required String email,
    required String phone,
  }) {
    _user = _user.copyWith(
      fullName: fullName,
      email: email,
      phone: phone,
    );
    notifyListeners();
  }
}
