import 'package:flutter/material.dart';

import '../models/admin_user_model.dart';

class UserProvider with ChangeNotifier {
  final List<AdminUser> _users = [
    AdminUser(id: '1', name: 'Ali', email: 'ali@gmail.com'),
    AdminUser(id: '2', name: 'Sara', email: 'sara@gmail.com'),
  ];

  List<AdminUser> get users => _users;

  void addUser(AdminUser user) {
    _users.add(user);
    notifyListeners();
  }

  void updateUser(AdminUser user) {
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
      notifyListeners();
    }
  }

  void deleteUser(String id) {
    _users.removeWhere((u) => u.id == id);
    notifyListeners();
  }
}
