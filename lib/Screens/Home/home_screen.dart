import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taptap/Screens/Home/Components/bottom_section.dart';
import 'package:taptap/Screens/Home/Components/top_section.dart';
import 'package:taptap/Screens/Settings/setting_screen.dart';
import 'package:taptap/Screens/Transactions/transactions_screen.dart';
import 'package:taptap/constans/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _indexNo = 0;

  final tabs = [
     const HomeScreenClass(),
     const TransactionScreen(),
     SettingScreen()
  ];

  final items = [
                    Icon(
                      Icons.home,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.payments,
                      size: 30,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    )
  ];

   Future<bool> exist() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: linear1,
            title: const Text(
              'Exit',
              style: TextStyle(color: gold),
            ),
            content: const Text(
              'Are you sure?',
              style: TextStyle(color: gold),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      child: const Text('Yes', style: TextStyle(color: gold)),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog.
                        SystemNavigator.pop();
                      },
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent)),
                      child: const Text('No', style: TextStyle(color: gold)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:WillPopScope(onWillPop: exist, child: tabs[_indexNo]),
     bottomNavigationBar: CurvedNavigationBar(
                  index: _indexNo,
                  height: 50,
                  items: items,
                  backgroundColor: Colors.transparent,
                  color: primaryOrange, // Background color of the bar
                  buttonBackgroundColor: primaryOrange,
                  animationCurve: Curves.easeInOut,
                  animationDuration: const Duration(milliseconds: 600),
                  onTap: (index) {
                    setState(() {
                    _indexNo = index;
                    });
                  }),   
    );
    
      
      
  }
}


class HomeScreenClass extends StatelessWidget {
  const HomeScreenClass({super.key});

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
             TopSection(), // Component for balance and buttons
             TransactionList(), // Ensure this widget is defined
          ],
        ),
      ));
  }
}
