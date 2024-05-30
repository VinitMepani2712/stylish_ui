import 'package:stylish_ui/model/cloth_item_model.dart';

class ClothItemsModel {
  final List<ClothModelItem> clothModelItems = [
    ClothModelItem(
      imagePath: 'assets/images/woman/woman1.jpg',
      title: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: 1500,
      originalPrice: 2499,
      discountPercentage: 40,
      rating: 4.5,
      reviewCount: 56890,
    ),
    ClothModelItem(
      imagePath: 'assets/images/man/man1.jpg',
      title: 'HRX by Hrithik Roshan',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: 2499,
      originalPrice: 4999,
      discountPercentage: 50,
      rating: 4.0,
      reviewCount: 344567,
    ),
    ClothModelItem(
      imagePath: 'assets/images/man/man2.jpg',
      title: 'HRX by Hrithik Roshan',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: 5000,
      originalPrice: 9999,
      discountPercentage: 50,
      rating: 4.0,
      reviewCount: 344567,
    ),
    ClothModelItem(
      imagePath: 'assets/images/woman/woman2.jpg',
      title: 'HRX by Hrithik Roshan',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: 4000,
      originalPrice: 8000,
      discountPercentage: 50,
      rating: 4.0,
      reviewCount: 344567,
    ),
  ];
}
