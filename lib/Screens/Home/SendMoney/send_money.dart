import 'package:flutter/material.dart';
import 'package:taptap/constans/colors.dart';



class SendMoneyScreen extends StatelessWidget {
  final Color backgroundColor = primaryOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'Current balance',
            style: TextStyle(color: Colors.white, fontSize: 18),
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
                'Rs. 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Rs. 0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          NumericKeypad(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.brown.shade400,
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('Request'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: Colors.brown.shade400,
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
                        onPressed: () {},
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
              onPressed: () {},
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
