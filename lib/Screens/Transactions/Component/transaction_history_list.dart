import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionHistoryList extends StatelessWidget {
  const TransactionHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
           Align(alignment: Alignment.center,child: const Text('Statement', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    buildTransactionItem("Ali Hamza", "6:54 AM", "+ Rs. 1,000", true),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false),
                    buildTransactionItem("Raffay Akmal", "6:54 AM", "+ Rs. 20", true),
                    buildTransactionItem("Faizan", "6:49 AM", "- Rs. 100", false),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false),
                    buildTransactionItem("Ali Hamza", "6:54 AM", "+ Rs. 1,000", true),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false),
                    buildTransactionItem("Raffay Akmal", "6:54 AM", "+ Rs. 20", true),
                    buildTransactionItem("Faizan", "6:49 AM", "-Rs. 100", false),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false),
                    buildTransactionItem("Raffay Akmal", "6:54 AM", "+ Rs. 20", true),
                    buildTransactionItem("Faizan", "6:49 AM", "- Rs. 100", false),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false),
                    buildTransactionItem("Ali Hamza", "6:54 AM", "+ Rs. 1,000", true),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false),
                    buildTransactionItem("Raffay Akmal", "6:54 AM", "+ Rs. 20", true),
                    buildTransactionItem("Faizan", "6:49 AM", "-Rs. 100", false),
                    buildTransactionItem("Ali Hamza", "6:49 AM", "- Rs. 400", false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTransactionItem(String name, String time, String amount, bool isIncome) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            isIncome ? Icons.arrow_downward : Icons.arrow_upward,
            color: isIncome ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(time, style: TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: TextStyle(
              color: isIncome ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
