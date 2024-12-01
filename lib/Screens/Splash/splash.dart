import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taptap/Screens/Authentication/Login/login_screen.dart';
import 'package:taptap/Screens/Home/home_screen.dart';
import 'package:taptap/constans/colors.dart';
import 'package:taptap/constans/methods.dart';



class SplashScreen extends StatefulWidget {
   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), ()async {
      String token =  await getToken();
      if(token == 'null')
      {
        popPush(context, const LoginScreen());
      }else{
        popPush(context, const HomeScreen());
      }
    });
    super.initState();
  }

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
                FadeInUp(
      duration: const Duration(milliseconds: 2000),
      child:Text(
                  'TapTap',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic, 
                    color: Colors.white,
                  ),
                )),
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
