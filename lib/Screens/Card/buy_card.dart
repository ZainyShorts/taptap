import 'package:flutter/material.dart';
import 'package:taptap/constans/colors.dart';



class BuyCardScreen extends StatefulWidget {
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<BuyCardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My cards"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Virtual"),
            Tab(text: "Physical"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCardContent(),
          _buildCardContent(),
        ],
      ),
    );
  }

  Widget _buildCardContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.asset(
              'assets/c2.png', // Placeholder for card image
              height: 250,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Request your card!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "SadaPay offers debit cards from the Mastercard and PayPak card networks.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                _showPurchaseDialog();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryOrange, // Button color
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Choose a card network"),
            ),
          ),
        ],
      ),
    );
  }

  void _showPurchaseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Purchase Card"),
          content: Text("Are you sure you want to purchase this card?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Add your purchase logic here
                _confirmPurchase();
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void _confirmPurchase() {
    // Implement the card purchase logic here
    // This could involve an API call, updating the UI, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Card purchase confirmed!")),
    );
  }
}
