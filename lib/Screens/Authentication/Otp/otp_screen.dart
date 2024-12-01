// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:taptap/Screens/Authentication/Login/login_screen.dart';
import 'package:taptap/constans/colors.dart';
import 'package:taptap/constans/env.dart';
import 'package:taptap/constans/methods.dart';
import 'package:taptap/constans/widgets/loader.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatefulWidget {
  final String? username;
  final String? email;
  final String? password;
  final String otp;
  const OtpScreen({
    super.key,
    this.username,
    this.email,
    this.password,
    required this.otp,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool loading = false;

  @override
  void dispose() {
    super.dispose();
  }


  

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle:  TextStyle(
        fontSize: 22 ,
        color: black,
      ),
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: black),
      ),
    );

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        // backgroundColor: black,
        // ignore: deprecated_member_use
        body: WillPopScope(
          onWillPop: ()async{
            Navigator.of(context).pop(false); 
            return true;
          },
          child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.orange.shade900,
                Colors.orange.shade800,
                Colors.orange.shade400
              ]
            )
          ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
  width: 150, // Diameter of the circle
  height: 200, // Diameter of the circle
  decoration: BoxDecoration(
    color: Colors.black, // Background color
    // shape: BoxShape.circle, // Ensures it's circular
    borderRadius: BorderRadius.circular(30),
    image: DecorationImage(
      image: AssetImage('assets/taptap.png'),
      fit: BoxFit.contain, // Ensures the image covers the circle
    ),
  ),
),
                       SizedBox(
                        height: 22,
                      ),
                       Text(
                        'Verification',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold, color: white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                       Text(
                        "Enter your OTP code number",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      loading == true ?
                       loader(context)
                       : Pinput(
                    length: 4,
                    defaultPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: white,
                        border: Border.all(color: Colors.transparent),
                      )
                    ),
                    
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: white,
                        
                        border: Border.all(color: Colors.transparent), 
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        color: white,
                        
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                    
                    onCompleted: (pin) async {

                    if(pin[0] != widget.otp[0] || pin[1] != widget.otp[1] || pin[2] != widget.otp[2] || pin[3] != widget.otp[3])
                    {
                      showToastAlert(context,'Invalid');
                      return;
                    }
                       final Map<String, dynamic> data = {
                            "email": widget.email,
                            "username":widget.username,
                            "password":widget.password
                          };

                              http.Response res = await http.post(
          Uri.parse('$url/signup'),
          body: jsonEncode(data),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        Map response = jsonDecode(res.body);
        

        if (response["success"] == true) {
              popPush(context, LoginScreen());
          }else{
            showToastAlert(context,response["msg"]);
            pop(context);
          }
                             
                    }),
                      SizedBox(
                        height: 18,
                      ),
                      
                      GestureDetector(
                        onTap: ()=> pop(context),
                        child:  Text(
                          "Didn't you receive any code?",
                          style: TextStyle(
                            
                            fontSize:  14,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                
              ),
            
          
        ),
    ),
    );
  }
}