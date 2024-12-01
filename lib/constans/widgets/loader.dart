import 'package:flutter/material.dart';
import 'package:taptap/constans/colors.dart';

Widget loader(BuildContext context) {
  return  Center(
    child:  CircularProgressIndicator(
      backgroundColor: white,
      color: Colors.grey.shade400,
    ),
  );
}