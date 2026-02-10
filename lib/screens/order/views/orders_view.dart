import 'package:flutter/material.dart';
import '../../../models/order_model.dart';
import '../components/order_tab.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Processing'),
              Tab(text: 'Shipped'),
              Tab(text: 'Delivered'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            OrderTab(status: OrderStatus.processing),
            OrderTab(status: OrderStatus.shipped),
            OrderTab(status: OrderStatus.delivered),
          ],
        ),
      ),
    );
  }
}