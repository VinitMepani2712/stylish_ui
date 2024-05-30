import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreen extends StatelessWidget {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildOrderSummarySection(),
            SizedBox(height: 16),
            buildPaymentSection(),
            SizedBox(height: 32),
            buildContinueButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildOrderSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildOrderSummaryRow('Order', '₹ 7,000'),
        buildOrderSummaryRow('Shipping', '₹ 30'),
        Divider(),
        buildOrderSummaryRow('Total', '₹ 7,030', isBold: true),
      ],
    );
  }

  Widget buildOrderSummaryRow(String label, String amount,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget buildPaymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        buildPaymentMethod(
          FontAwesomeIcons.ccVisa,
          '************2109',
          isSelected: true,
        ),
        SizedBox(height: 16),
        buildPaymentMethod(
          FontAwesomeIcons.paypal,
          '************2109',
        ),
        SizedBox(height: 16),
        buildPaymentMethod(
          FontAwesomeIcons.ccMastercard,
          '************2109',
        ),
        SizedBox(height: 16),
        buildPaymentMethod(
          FontAwesomeIcons.applePay,
          '************2109',
        ),
      ],
    );
  }

  Widget buildPaymentMethod(IconData icon, String cardNumber,
      {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xffF4F4F4),
        border: Border.all(color: isSelected ? Colors.red : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
          ),
          Text(cardNumber, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildContinueButton(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        // Show dialog on button press
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Payment Successful'),
              content: Text('Your payment was successful.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Fixing typo here
        ),
      ),
      child: Text(
        'Continue',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ));
  }
}
