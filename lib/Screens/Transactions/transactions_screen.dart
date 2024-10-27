import 'package:flutter/material.dart';
import 'package:taptap/Screens/Transactions/Component/transaction_history_list.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 255),
      body:  SingleChildScrollView(
        child: Column(
          children: [ // Component for balance and buttons
             TransactionHistoryList()// Ensure this widget is defined
          ],
        ),
      ),
      
    );
  }
}