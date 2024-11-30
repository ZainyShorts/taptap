
import 'package:flutter/material.dart';
import 'package:taptap/constans/colors.dart';

class TransactionsDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dullBg,
      appBar: AppBar(
        title: Text(
          'Money Sent',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: primaryOrange,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryOrange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30), // Adjust as needed
                bottomRight: Radius.circular(30), // Adjust as needed
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Column(
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  size: 70,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'Rs. 100',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'From Syed Ali Zain Ul Abdin\nto SYED ALI ZAIN UL ABADEEN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '26 October 2024, 07:01 AM',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow("From", "SadaPay", "3364569588"),
                    SizedBox(height: 10),
                    buildDetailRow("To", "Easypaisa", "923364569588"),
                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 5),
                    buildDetailRow("Reference number", "1LINK-720815", null),
                    // SizedBox(height: 10),
                    // buildDetailRow("Service fee + Tax", "Rs. 0 🎉", null),
                  ],
                ),
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDetailRow("Service fee + Tax", "Rs. 0 🎉", null),
                    // SizedBox(height: 10),
                    // buildDetailRow("Service fee + Tax", "Rs. 0 🎉", null),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailRow(String title, String subtitle, String? number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            if (number != null)
              Text(number, style: TextStyle(fontSize: 16, color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
