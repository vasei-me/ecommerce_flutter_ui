import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/admin/screens/dashboard/admin_dashboard_view.dart';
import 'package:shop/entry_point.dart';
import 'package:shop/providers/auth_provider.dart';
import 'package:shop/screens/auth/views/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    // هنوز لاگین نکرده
    if (!auth.isLoggedIn) {
      return const LoginScreen();
    }

    // لاگین کرده
    if (auth.role == UserRole.admin) {
      return const AdminDashboardView();
    }

    // User عادی
    return const EntryPoint(); // صفحه اصلی فروشگاه
  }
}
