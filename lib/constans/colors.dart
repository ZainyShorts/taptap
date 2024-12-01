
import 'package:flutter/material.dart';

const primaryOrange = Color(0xFFFF7B66);

const primaryGreen = Color(0xFF01D2B0);

const primaryBlue = Color(0xFF1EA7F1);

const dullBg = Color(0xFFF1F5F6);

const LinearGradient gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF5722), // Equivalent to Colors.orange.shade900
    Color(0xFFFF7043), // Equivalent to Colors.orange.shade800
    Color(0xFFFFAB91), // Equivalent to Colors.orange.shade400
  ],
);



const b2 = Color.fromRGBO(7, 38, 37, 50);
const logo = Color.fromRGBO(194, 156, 71, 100);
const linear1 = Color.fromRGBO(1, 24, 23, 10);
const gold = Color.fromRGBO(255, 219, 26, 10);

const white = Colors.white;


const black = Colors.black;

bool isScreenLarge(BuildContext context) {
  if(MediaQuery.of(context).size.shortestSide > 700)
  {
    return true;
  }
  return false;
}



const ipadScreenHorizontalPadding = 50.0;
const phoneScreenHorizontalPadding = 18.0;
