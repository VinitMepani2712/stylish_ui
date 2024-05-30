import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/check_out_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CheckoutScreen(),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildAddressSection(context),
            SizedBox(height: 16),
            Text("Shopping List"),
            buildShoppingListSection(context),
          ],
        ),
      ),
    );
  }
}

@override
Widget buildAddressSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.location_on_rounded),
          Text('Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
      SizedBox(height: 8.h),
      Row(
        children: [
          Container(
            height: 90.h,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address: 216 St Paul\'s Rd, \nLondon N1 2LL, UK',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('Contact: +44-784232'),
                  ],
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            height: 90.h,
            width: 70.w,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.add),
          ),
        ],
      ),
    ],
  );
}

Widget buildShoppingListSection(BuildContext context) {
  return Expanded(
    child: ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ShoppingItem(item: items[index]);
      },
    ),
  );
}

class ShoppingItem extends StatelessWidget {
  final ShoppingItemModel item;

  ShoppingItem({
    required this.item,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  item.imagePath,
                  width: 90,
                  height: 100,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Text('Variations: '),
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(05),
                            ),
                            child: Text("${item.variation1}"),
                          ),
                          SizedBox(width: 5.0.h),
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(05),
                            ),
                            child: Text("${item.variation2}"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text('${item.rating}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text('\₹${item.price}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text('\₹${item.originalPrice}',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      ),
                      Text('upto ${item.discount}% off',
                          style: TextStyle(color: Colors.red)),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Order(1) : "),
                Text('₹${item.price}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
