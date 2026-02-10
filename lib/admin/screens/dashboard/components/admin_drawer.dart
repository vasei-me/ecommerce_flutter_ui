import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Admin Panel"),
            accountEmail: Text("admin@shop.com"),
            currentAccountPicture:
                CircleAvatar(child: Icon(Icons.admin_panel_settings)),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text("Dashboard"),
            onTap: () => Navigator.pushReplacementNamed(context, '/admin'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text("Products Management"),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/admin/products'),
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Users Management"),
            onTap: () =>
                Navigator.pushReplacementNamed(context, '/admin/users'),
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
