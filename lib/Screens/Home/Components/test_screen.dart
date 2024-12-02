import 'package:flutter/material.dart';

class testScreen extends StatelessWidget {
  // Hardcoded list of transactions
  final List<Map<String, dynamic>> transactions = [
    {
      '_id': '674d0ffddc19ac7db16dc820',
      'sender': '674ad3f9641dd44f81628852',
      'receiver': '674ad3f9641dd44f81628853',
      'senderName': 'Zain',
      'receiverName': 'Faizan',
      'amount': 200,
      'createdAt': '2024-12-02T01:40:13.399Z',
    },
    {
      '_id': '674d105fdc19ac7db16dc821',
      'sender': '674ad3f9641dd44f81628852',
      'receiver': '674ad3f9641dd44f81628853',
      'senderName': 'Zain',
      'receiverName': 'Faizan',
      'amount': 300,
      'createdAt': '2024-12-02T01:41:51.820Z',
    },
    {
      '_id': '674d1124dc19ac7db16dc822',
      'sender': '674ad3f9641dd44f81628852',
      'receiver': '674ad3f9641dd44f81628853',
      'senderName': 'Zain',
      'receiverName': 'Faizan',
      'amount': 13,
      'createdAt': '2024-12-02T01:45:08.657Z',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: ListView.builder(
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
    );
  }
}

