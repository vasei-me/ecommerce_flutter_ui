import 'package:flutter/material.dart';

import '../models/admin_product_model.dart';

class ProductProvider with ChangeNotifier {
  final List<AdminProduct> _products = [
    AdminProduct(
        id: '1',
        title: 'Shoes',
        price: 120,
        imageUrl: 'https://example.com/shoes.jpg'),
    AdminProduct(
        id: '2',
        title: 'T-Shirt',
        price: 40,
        imageUrl: 'https://example.com/tshirt.jpg'),
  ];

  List<AdminProduct> get products => _products;

  void addProduct(AdminProduct product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(AdminProduct product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
