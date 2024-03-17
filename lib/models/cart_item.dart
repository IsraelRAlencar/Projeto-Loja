class CartItem {
  late final String id;
  late final String productId;
  late final String name;
  late final int quantity;
  late final double price;

  CartItem({
    required this.id,
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
