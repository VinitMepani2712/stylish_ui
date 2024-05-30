import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/shooping_screen_model.dart'; // Ensure the path to your model is correct

class ShoppingBagScreen extends StatelessWidget {
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
        title: Text('Shopping Bag'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Handle favorite button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildShoppingItemSection(item),
            SizedBox(height: 16),
            buildApplyCouponsSection(),
            Divider(),
            SizedBox(height: 16),
            buildOrderPaymentDetailsSection(),
            SizedBox(height: MediaQuery.of(context).size.height / 2.9.h),
            buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildShoppingItemSection(ShoppingItemModel item) {
    return Row(
      children: [
        Image.asset(
          item.imagePath,
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(item.description,
                style: TextStyle(
                  fontSize: 12,
                )),
            SizedBox(height: 8),
            Row(
              children: [
                Text('Size: ${item.size}'),
                SizedBox(width: 16),
                Text('Qty: ${item.quantity}'),
              ],
            ),
            SizedBox(height: 8),
            Text('Delivery by ${item.deliveryDate}'),
          ],
        ),
      ],
    );
  }

  Widget buildApplyCouponsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.local_offer),
            SizedBox(width: 8),
            Text('Apply Coupons'),
          ],
        ),
        Text('Select', style: TextStyle(color: Colors.red)),
      ],
    );
  }

  Widget buildOrderPaymentDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Order Payment Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        OrderDetailRow(label: 'Order Amounts', amount: '₹7,000.00'),
        OrderDetailRow(
          label: 'Convenience',
          action: 'Know More',
          amount: '          Apply Coupon',
        ),
        OrderDetailRow(label: 'Delivery Fee', amount: 'Free'),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 8),
        OrderDetailRow(label: 'Order Total', amount: '₹7,000.00'),
        SizedBox(height: 8),
        Text('EMI Available', style: TextStyle(color: Colors.red)),
      ],
    );
  }
}

Widget buildBottomBar(BuildContext context) {
  return Column(
    children: [
      Divider(),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('₹7,000.00',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                // Handle proceed to payment
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                'Proceed to Payment',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class OrderDetailRow extends StatelessWidget {
  final String label;
  final String amount;
  final String? action;

  OrderDetailRow({required this.label, required this.amount, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(label),
        ),
        Row(
          children: [
            if (action != null) ...[
              Text(action!, style: TextStyle(color: Colors.red)),
              SizedBox(width: 8),
            ],
            Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
