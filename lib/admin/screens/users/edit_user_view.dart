import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/admin_user_model.dart';
import '../../providers/user_provider.dart';

class EditUserView extends StatefulWidget {
  const EditUserView({super.key});

  @override
  State<EditUserView> createState() => _EditUserViewState();
}

class _EditUserViewState extends State<EditUserView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _userId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userId = ModalRoute.of(context)!.settings.arguments as String?;
    if (_userId != null) {
      final user = Provider.of<UserProvider>(context, listen: false)
          .users
          .firstWhere((u) => u.id == _userId);
      _nameController.text = user.name;
      _emailController.text = user.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit User')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUser,
              child: const Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateUser() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();

    if (_userId != null && name.isNotEmpty && email.isNotEmpty) {
      final user = AdminUser(
        id: _userId!,
        name: name,
        email: email,
      );
      Provider.of<UserProvider>(context, listen: false).updateUser(user);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
