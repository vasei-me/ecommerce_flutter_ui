import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/admin/providers/product_provider.dart';
import 'package:shop/providers/user_provider.dart';
import 'package:shop/providers/order_provider.dart';
import 'package:shop/admin/routes/admin_routes.dart';
import 'package:shop/providers/auth_provider.dart';
import 'package:shop/route/router.dart' as router;
import 'package:shop/screens/auth/auth_gate.dart';
import 'package:shop/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

// Thanks for using our template. You are using the free version of the template.
// 🔗 Full template: https://theflutterway.gumroad.com/l/fluttershop

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop Template by The Flutter Way',
        theme: AppTheme.lightTheme(context),
        // Dark theme is inclided in the Full template
        themeMode: ThemeMode.light,
        home: const AuthGate(),
        routes: adminRoutes,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
