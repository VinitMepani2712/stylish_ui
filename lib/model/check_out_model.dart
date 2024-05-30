class ShoppingItemModel {
  final String imagePath;
  final String title;
  final String variation1;
    final String variation2;

  final double rating;
  final double price;
  final double originalPrice;
  final int discount;

  ShoppingItemModel({
    required this.imagePath,
    required this.title,
    required this.variation1,
        required this.variation2,

    required this.rating,
    required this.price,
    required this.originalPrice,
    required this.discount,
  });
}

final List<ShoppingItemModel> items = [
  ShoppingItemModel(
    imagePath: 'assets/images/wishlist_screen_images/5.png',
    title: "Women's Casual Wear",
    variation1 : 'Black',
    variation2: 'Red',
    rating: 4.8,
    price: 600.00,
    originalPrice: 900.00,
    discount: 33,
  ),
  ShoppingItemModel(
    imagePath: 'assets/images/wishlist_screen_images/2.png',
    title: "Men's Jacket",
  variation1: 'White',
    variation2: 'Grey',
    rating: 4.7,
    price: 900.00,
    originalPrice: 1800.00,
    discount: 50,
  ),
];
