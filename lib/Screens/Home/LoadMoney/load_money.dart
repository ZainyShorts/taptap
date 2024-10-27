import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadMoneyScreen extends StatelessWidget {
  const LoadMoneyScreen({super.key});

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
                const Text(
                  'Rs. 48,700 incoming limit left this month',
                  style: TextStyle(color: Colors.red, fontSize: 16),
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
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Set button color to orange
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
            icon: const Icon(Icons.copy, color: Colors.orange),
            onPressed: () {
              // Add copy functionality here
            },
          )
        ],
      ),
    );
  }
}