import 'package:flutter/material.dart';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  final List<OrderModel> _orders = [
    OrderModel(
      id: '1001',
      date: DateTime.now().subtract(Duration(days: 1)),
      totalPrice: 120.5,
      status: OrderStatus.processing,
    ),
    OrderModel(
      id: '1002',
      date: DateTime.now().subtract(Duration(days: 3)),
      totalPrice: 89.9,
      status: OrderStatus.shipped,
    ),
    OrderModel(
      id: '1003',
      date: DateTime.now().subtract(Duration(days: 7)),
      totalPrice: 250,
      status: OrderStatus.delivered,
    ),
  ];

  List<OrderModel> getOrdersByStatus(OrderStatus status) {
    return _orders.where((o) => o.status == status).toList();
  }
}