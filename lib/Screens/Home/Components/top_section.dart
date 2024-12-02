import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:http/http.dart' as http;
import 'package:nfc_manager/nfc_manager.dart';
import 'package:taptap/Screens/Home/LoadMoney/load_money.dart';
import 'package:taptap/Screens/Home/SendMoney/send_money.dart';
import 'package:taptap/constans/colors.dart';
import 'package:taptap/constans/env.dart';
import 'package:taptap/constans/methods.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {

  int balance = 0; 
  void getBalance() async {
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
  void initState(){
    super.initState();
    getBalance();
    _startNFCReading();
  }


void _startNFCReading() async {
  try {
    bool isAvailable = await NfcManager.instance.isAvailable();
    if (isAvailable) {
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Extract NFC data
          final nfcData = tag.data.toString();

          // Stop the session to prevent further system-level handling
          await NfcManager.instance.stopSession();

          // Show NFC modal with the tag's data
          _showNfcModal(nfcData);
        },
        onError: (error) async {
          debugPrint('NFC Error: $error');
          await NfcManager.instance.stopSession();
        },
      );
    } else {
      debugPrint('NFC not available on this device.');
    }
  } catch (e) {
    debugPrint('Error initializing NFC: $e');
  }
}


  void _showNfcModal(String nfcData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('NFC Tag Detected'),
          content: Text('Data: $nfcData'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              // Current Balance Card
              Expanded(
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [

                            InkWell(
                              onTap: _startNFCReading,
                              child: Text(
                                'Current balance',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                             Text(
                          'Rs. $balance',
                          style: TextStyle(
                            
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),)
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                            'assets/master.png', // Add your logo image path here
                            width: 100, // Adjust logo size as needed
                          ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                          ],
                        )
                       
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Load Money and Send/Request Buttons
              Column(
                children: [
                  // Load Money Button
                  InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoadMoneyScreen())),
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                             padding: EdgeInsets.all(8.0),
                             child: Icon(Icons.arrow_downward, color: Colors.white),
                           ),
                           Padding(
                            padding:  EdgeInsets.all(8.0),
                            child:  Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  'Load\nmoney',
                                  style: TextStyle(color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Send  Button
                 InkWell(
                     onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SendMoneyScreen())),
                    child:  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color:primaryOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                           padding: EdgeInsets.all(8.0),
                           child: Align(
                            alignment:Alignment.topRight,
                            child: Icon(Icons.north_east, color: Colors.white,)),
                         ),
                        Padding(
                            padding:  EdgeInsets.all(8.0),
                            child:  Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  'Send',
                                  style: TextStyle(color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,),
                                ),
                            ),
                          ),
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
