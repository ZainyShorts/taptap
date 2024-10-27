import 'dart:js';

import 'package:flutter/material.dart';
import 'package:taptap/Screens/Transactions/transactions_detail.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Oct 27', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                          Text('+ Rs. 0', style: TextStyle(fontSize: 15,color: Colors.grey.shade300, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),

                    buildTransactionItem("Ali Hamza", "6:54 AM", "+ Rs. 1,000", true,context),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false,context),
                    buildTransactionItem("Raffay Akmal", "6:54 AM", "+ Rs. 20", true,context),
                    buildTransactionItem("Faizan", "6:49 AM", "- Rs. 100", false,context),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false,context),
                    buildTransactionItem("Ali Hamza", "6:54 AM", "+ Rs. 1,000", true,context),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false,context),
                    buildTransactionItem("Raffay Akmal", "6:54 AM", "+ Rs. 20", true,context),
                    buildTransactionItem("Faizan", "6:49 AM", "-Rs. 100", false,context),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false,context),
                  ],
                ),
              ),
            ),
            // SizedBox(height: 20),
            // Text('Oct 01', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // SizedBox(height: 10),
            // Container(
            //   color: Colors.white,
            //   child: Column(
            //     children: [
            //       buildTransactionItem("Abdul Rahman", "7:37 PM", "+ Rs. 500", true,context),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionItem(String name, String time, String amount, bool isIncome, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionsDetailScreen())),
        child: Row(
          children: [
            Icon(
              isIncome ? Icons.arrow_downward : Icons.arrow_upward,
              color: isIncome ? Colors.green : Colors.red,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(time, style: TextStyle(color: Colors.grey)),
              ],
            ),
            Spacer(),
            Text(
              amount,
              style: TextStyle(
                color: isIncome ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
