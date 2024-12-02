
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taptap/Screens/Transactions/transactions_detail.dart';
import 'package:taptap/constans/env.dart';
import 'package:taptap/constans/methods.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  List transactions = [];
  String myId = "";

  void getTransactions() async {
    try {
      String token = await getToken(); 
      http.Response res = await http.get(
        Uri.parse('$url/getTransactions'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', 
        },
      );
      Map response = jsonDecode(res.body);
      // print(response['transactions'].length);
      if (response["success"] == true) {

    setState(() {
      transactions = response['transactions'];  // Extract the transactions list
    });
      }
    } catch (e) {}
  }
  void getId() async {
    try {
      String token = await getToken(); 
      http.Response res = await http.get(
        Uri.parse('$url/getId'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', 
        },
      );
      Map response = jsonDecode(res.body);
      if (response["success"] == true) {
        setState(() {
        myId = response['id'];
        });
      }
    } catch (e) {}
  }
  

  @override
  void initState(){
    super.initState();
    getId();
    getTransactions();
  }
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
                    transactions.isEmpty
          ? Center(child: CircularProgressIndicator())
          :
          ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          final createdAt = DateTime.parse(transaction['createdAt']);

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                'From: ${transaction['senderName']} to ${transaction['receiverName']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: \$${transaction['amount']}'),
                  Text('Date: ${createdAt.toLocal()}'),
                ],
              ),
            ),
          );
        },
      ),
    
                  ],
                ),
              ),
            ),
           
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


// @override
// Widget build(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.all(16.0),
//     child: Container(
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 30),
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             child: Container(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Transactions',
//                           style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           '+ Rs. 0',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.grey.shade300,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Divider(),
//                   transactions.isEmpty
//                       ? Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 20),
//                             child: Text('No transactions available'),
//                           ),
//                         )
//                       : ListView.builder(
//                           shrinkWrap: true, // Ensures the ListView takes minimal height
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: transactions.length,
//                           itemBuilder: (context, index) {
//                             final transaction = transactions[index] as Map<String, dynamic>;
//                             return buildTransactionItem(
//                               transaction['name'] ?? 'Unknown',
//                               transaction['time'] ?? 'Unknown',
//                               transaction['amount'] ?? 'Rs. 0',
//                               transaction['isIncome'] ?? false,
//                               context,
//                             );
//                           },
//                         ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }


