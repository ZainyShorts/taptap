import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:taptap/constans/colors.dart';
import 'package:taptap/constans/env.dart';
import 'package:taptap/constans/methods.dart';
import 'package:taptap/stripe/stripe_service.dart';

class LoadMoneyScreen extends StatefulWidget {
  const LoadMoneyScreen({super.key});

  @override
  State<LoadMoneyScreen> createState() => _LoadMoneyScreenState();
}

class _LoadMoneyScreenState extends State<LoadMoneyScreen> {
  TextEditingController _amountController = new TextEditingController();

   int limit = 0;


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
        limit = response['limit'];
        });
      }
    } catch (e) {}
  }


  void upgradeBalance(int amount) async {
    try {
      String token = await getToken(); 
      final Map<String, dynamic> data = {
          "amount": amount
        };
      http.Response res = await http.post(
        body: jsonEncode(data),
        Uri.parse('$url/upgradeBalance'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', 
        },
      );
      Map response = jsonDecode(res.body);
      print(response);

      if (response["success"] == true) {
         getLimit();
      }
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getLimit();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.black),
                                onPressed: ()=>Navigator.pop(context),
                              ),
                ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const Text(
              "Load money",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
            ),
                 Text(
                  'Rs. $limit incoming limit left this month',
                  style: TextStyle(color: primaryOrange, fontSize: 16),
                ),
                SizedBox(height: 30),
                const Text(
                  'Receive local transfers',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
               const SizedBox(height: 10),
                _buildTransferContainer('SU92-BSSEM-F22-030'),
                const SizedBox(height: 30),
                const Text(
                  'Recharge Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                 const SizedBox(height: 10),
                 TextField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Enter Amount in PKR',
        floatingLabelStyle: TextStyle(
          color: primaryOrange, // Change label color on focus
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryOrange, // Border color when focused
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // Border color when not focused
            width: 1.0,
          ),
        ),
      ),
    ),
            SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: ()async{
                    if(_amountController.text.isEmpty){
                      showToastAlert(context, 'Enter amount');
                      return;
                    }
                    int userInputAmount = int.parse(_amountController.text);
                    if(userInputAmount > 139 ){
                        if(userInputAmount>limit){
                          showToastAlert(context, 'Action not allowed: Limit reached. ❌');

                          return;
                        }
                     await StripeService.instance.makePayment(userInputAmount);
                     upgradeBalance(userInputAmount);
                     _amountController.text = "";
                     showToastAlert(context, 'Success ✅');
                     return;
                    }else{
                      showToastAlert(context, 'Min 150rs ');
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryOrange, // Set button color to orange
                  ), child: const Text('Recharge',style: TextStyle(color: Colors.white),),),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransferContainer(String accountNumber) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              accountNumber,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.copy, color: primaryOrange),
            onPressed: () {
              showToastAlert(context, 'Copied to clipboard ✅');
              Clipboard.setData(ClipboardData(text: accountNumber));
            },
          )
        ],
      ),
    );
  }
}