class ClothModelItem {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final double originalPrice;
  final double discountPercentage;
  final double rating;
  final int reviewCount;

  ClothModelItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discountPercentage,
    required this.rating,
    required this.reviewCount,
  });
}
