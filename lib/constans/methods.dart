import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';


void showToastAlert(BuildContext context, String message) {
  toastification.show(
  context: context, // optional if you use ToastificationWrapper
  title: Text(message),
  autoCloseDuration: const Duration(seconds: 3),
  closeOnClick: false,
  pauseOnHover: true,
  dragToClose: true,
  
);
}


void replace(BuildContext context,Widget screen)
{
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>screen));
}
void push(BuildContext context,Widget screen)
{
  Navigator.push(context, MaterialPageRoute(builder: (_)=>screen));
}
void popPush(BuildContext context,Widget screen)
{
  while (Navigator.of(context).canPop()) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                            }
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  screen));
}

Future<bool> onBackPressed(BuildContext context,Widget screen) async {
    while (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => screen));
    return true;
  }

void pop(BuildContext context)
{
  Navigator.of(context).pop(false); 
  
}



Future<String> getEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  if (email == null) {
    return "null";
  }
  return email;
}

Future<String> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  if (token == null) {
    return "null";
  }
  return token;
}
