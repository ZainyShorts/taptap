import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taptap/Screens/Home/home_screen.dart';
import 'package:taptap/constans/colors.dart';
import 'package:taptap/constans/env.dart';
import 'package:taptap/constans/methods.dart';
import 'package:taptap/constans/widgets/loader.dart';

class SendMoneyScreen extends StatefulWidget {
  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final Color backgroundColor = primaryOrange;
  String amount = '0'; // Holds the typed amount
  TextEditingController ac = new TextEditingController();
  bool loading = false;

  void updateAmount(String value) {
    setState(() {
      // Append value to the amount, ensuring it doesn't start with 0 unless it's the only digit
      if (amount == '0') {
        amount = value;
      } else {
        amount += value;
      }
    });
  }

  void deleteLastDigit() {
    setState(() {
      // Remove the last digit; reset to '0' if empty
      if (amount.isNotEmpty) {
        amount =
            amount.length > 1 ? amount.substring(0, amount.length - 1) : '0';
      }
    });
  }

  int balance = 0;
  void getLimit() async {
    try {
      String token = await getToken();
      http.Response res = await http.get(
        Uri.parse('$url/getBalance'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      Map response = jsonDecode(res.body);
      print(response);

      if (response["success"] == true) {
        setState(() {
          balance = response['balance'];
        });
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getLimit();
  }

  void sendMoney() async {
    try {
      setState(() {
        loading = true;
      });
      final Map<String, dynamic> data = {
        "amount": int.parse(amount),
        "ac": ac.text
      };

      String token = await getToken();
      http.Response res = await http.post(
        body: jsonEncode(data),
        Uri.parse('$url/sendMoney'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      Map response = jsonDecode(res.body);

      if (response["success"] == true) {
        showToastAlert(context, response['msg']);
        ac.text="";
        amount='0';
        getLimit();
        pop(context);
      }else{
        showToastAlert(context, response['msg']);
      }
    } catch (e) {}finally{
       setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => popPush(context,const HomeScreen()),
        ),
        title: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Current balance',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                '$balance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.signal_cellular_alt, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                'Rs. $amount', // Display the typed amount
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          NumericKeypad(
            onNumberPressed: updateAmount,
            onBackspacePressed: deleteLastDigit,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('Request'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int val = int.parse(amount);
                    if (val <= 0) {
                      showToastAlert(context, 'Minimun 1rs');
                      return;
                    }
                    if (balance <= val) {
                      showToastAlert(context, 'Insufficent balance 😔');
                      return;
                    }
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'A/C Number',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: primaryOrange),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          content: TextField(
                            controller: ac,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Enter account no',
                              floatingLabelStyle: TextStyle(
                                color:
                                    primaryOrange, // Change label color on focus
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      primaryOrange, // Border color when focused
                                  width: 2.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .grey, // Border color when not focused
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                          actions: [
                            
                            ElevatedButton(
                              onPressed: () {
                                // Handle the continue action here
                                sendMoney();
                                
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryOrange,
                              ),
                              child: loading ? loader(context) :const Text(
                                'Continue',
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumericKeypad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onBackspacePressed;

  NumericKeypad({
    required this.onNumberPressed,
    required this.onBackspacePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          for (var row in [
            ['1', '2', '3'],
            ['4', '5', '6'],
            ['7', '8', '9'],
            ['0']
          ])
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: row
                  .map(
                    (number) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => onNumberPressed(number),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(15),
                        ),
                        child: Text(
                          number,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: onBackspacePressed,
              icon: Icon(
                Icons.backspace_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
