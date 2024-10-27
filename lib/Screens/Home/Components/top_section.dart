import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taptap/Screens/Home/LoadMoney/load_money.dart';
import 'package:taptap/Screens/Home/SendMoney/send_money.dart';
import 'package:taptap/constans/colors.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

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
                            Text(
                              'Current balance',
                              style: TextStyle(color: Colors.white),
                            ),
                             Text(
                          'Rs. 1,021',
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
