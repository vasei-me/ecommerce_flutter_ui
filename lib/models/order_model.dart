enum OrderStatus {
  processing,
  shipped,
  delivered,
}

class OrderModel {
  final String id;
  final DateTime date;
  final double totalPrice;
  final OrderStatus status;

  OrderModel({
    required this.id,
    required this.date,
    required this.totalPrice,
    required this.status,
  });
}