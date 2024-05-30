// shopping_item_model.dart

class ShoppingItemModel {
  final String imagePath;
  final String title;
  final String description;
  final String size;
  final int quantity;
  final String deliveryDate;

  ShoppingItemModel({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.size,
    required this.quantity,
    required this.deliveryDate,
  });
}

final ShoppingItemModel item = ShoppingItemModel(
  imagePath: 'assets/images/man/man2.jpg',
  title: "Men's Casual Wear",
  description: 'Checked Single-Breasted Blazer',
  size: '42',
  quantity: 1,
  deliveryDate: '10 May 2024',
);
