import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptap/Screens/Authentication/Login/login_screen.dart';
import 'package:taptap/Screens/Authentication/Otp/otp_screen.dart';
import 'package:taptap/Screens/Authentication/Signnup/signup_screen.dart';
import 'package:taptap/Screens/Card/buy_card.dart';

import 'package:taptap/Screens/Home/home_screen.dart';
import 'package:taptap/Screens/Splash/splash.dart';
import 'package:taptap/Screens/Transactions/Payment/payment_send_preview.dart';
import 'package:taptap/Screens/Transactions/transactions_detail.dart';
import 'package:taptap/Screens/onBoarding/onboarding_view.dart';
import 'package:taptap/constans/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setup();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding")??false;

  runApp( MyApp(onboarding: onboarding));
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = stripePublishableKey;
}


class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, required this.onboarding,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tap Tap',
      theme: ThemeData(
        primaryColor: Colors.orange.shade200,
        fontFamily: 'Helvetica',
      ),
      home: 
      // onboarding ?
         HomeScreen() 
        // :
          //  SplashScreen(),
    );
  }
}
