import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/order_model.dart';
import '../../../providers/order_provider.dart';
import 'order_card.dart';
import 'empty_orders.dart';

class OrderTab extends StatelessWidget {
  final OrderStatus status;

  const OrderTab({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (_, provider, __) {
        final orders = provider.getOrdersByStatus(status);

        if (orders.isEmpty) {
          return const EmptyOrders();
        }

        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (_, index) {
            return OrderCard(order: orders[index]);
          },
        );
      },
    );
  }
}