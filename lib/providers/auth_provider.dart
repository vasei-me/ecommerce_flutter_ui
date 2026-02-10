import 'package:flutter/material.dart';

enum UserRole { user, admin }

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  UserRole? _role;

  bool get isLoggedIn => _isLoggedIn;
  UserRole? get role => _role;

  void login({
    required String email,
    required String password,
    required UserRole role,
  }) {
    // ✅ فعلاً Mock Login (بدون بک‌اند)
    _isLoggedIn = true;
    _role = role;
    notifyListeners();
  }

  void register({
    required String email,
    required String password,
    required UserRole role,
  }) {
    // در آینده API واقعی
    _isLoggedIn = true;
    _role = role;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _role = UserRole.user;
    notifyListeners();
  }
}
