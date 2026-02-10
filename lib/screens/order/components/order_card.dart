import 'package:flutter/material.dart';
import '../../../models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        title: Text('Order #${order.id}'),
        subtitle: Text(
          'Total: \$${order.totalPrice}\n'
          'Date: ${order.date.toLocal().toString().split(' ')[0]}',
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}