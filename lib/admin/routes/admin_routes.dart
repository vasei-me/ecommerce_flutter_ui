import 'package:flutter/material.dart';

import '../screens/dashboard/admin_dashboard_view.dart';
import '../screens/products/add_product_view.dart';
import '../screens/products/edit_product_view.dart';
import '../screens/products/product_list_view.dart';
import '../screens/users/add_user_view.dart';
import '../screens/users/edit_user_view.dart';
import '../screens/users/user_list_view.dart';

final Map<String, WidgetBuilder> adminRoutes = {
  '/admin': (context) => const AdminDashboardView(),
  '/admin/products': (context) => const ProductListView(),
  '/admin/products/add': (context) => const AddProductView(),
  '/admin/products/edit': (context) => const EditProductView(),
  '/admin/users': (context) => const UserListView(),
  '/admin/users/add': (context) => const AddUserView(),
  '/admin/users/edit': (context) => const EditUserView(),
};
