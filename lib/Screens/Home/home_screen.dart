import 'package:flutter/material.dart';
import 'package:taptap/Screens/Home/Components/bottom_section.dart';
import 'package:taptap/Screens/Home/Components/top_section.dart';
import 'package:taptap/Screens/Settings/setting_screen.dart';
import 'package:taptap/Screens/Transactions/transactions_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 255),
      body: const SingleChildScrollView(
        child: Column(
          children: [
             TopSection(), // Component for balance and buttons
             TransactionList(), // Ensure this widget is defined
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 10,
        selectedItemColor: Colors.orange,
        unselectedFontSize: 10,
        items:  [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Personal"),
          BottomNavigationBarItem(icon: InkWell(onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const TransactionScreen())), child: Icon(Icons.payments)), label: "Payments"),
          BottomNavigationBarItem(icon: InkWell(onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> InfoScreen())),child:  Icon(Icons.menu)), label: "More"),
        ],
      ),
    );
  }
}
