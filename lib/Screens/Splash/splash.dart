import 'package:flutter/material.dart';
import 'package:taptap/constans/colors.dart';



class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryOrange, // Background color matching the image
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SadaPay Logo
                // Image.asset(
                //   'assets/taptap.png', // Add your logo image path here
                //   width: 100, // Adjust logo size as needed
                // ),
                SizedBox(height: 10),
                Text(
                  'TapTap',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic, 
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1:03',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Icon(Icons.signal_wifi_4_bar, color: Colors.black),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
          // Bottom navigation bar indicator
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SadaPayScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SadaPayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF7043), // Background color matching the image
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SadaPay Logo
                Image.asset(
                  'assets/sadapay_logo.png', // Add your logo image path here
                  width: 100, // Adjust logo size as needed
                ),
                SizedBox(height: 10),
                Text(
                  'SADAPAY',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '1:03',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Icon(Icons.signal_wifi_4_bar, color: Colors.black),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '10',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
          // Bottom navigation bar indicator
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
