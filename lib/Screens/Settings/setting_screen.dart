import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taptap/Screens/Authentication/Login/login_screen.dart';
import 'package:taptap/constans/methods.dart';


class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6FBF7), // Light background color

      body: SingleChildScrollView( // Make the content scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

           const SizedBox(height: 50),
           _buildInfoTile(
              icon: Icons.picture_in_picture,
              text: 'Zain ul abdin',
            ),
            _buildInfoTile(
              icon: Icons.security,
              text: 'Privacy policy',
            ),
            _buildInfoTile(
              icon: Icons.description,
              text: 'Terms & conditions',
            ),
            SizedBox(height: 30),
            _buildInfoTile(
              icon: Icons.devices,
              text: 'Manage devices',
              trailingIcon: Icons.arrow_forward_ios,
            ),
            _buildInfoTile(
              icon: Icons.account_balance_wallet,
              text: 'Close account',
            ),
            _buildInfoTile(
              icon: Icons.logout,
              text: 'Log out',
              fn: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.clear(); 
                popPush(context, LoginScreen());
              },
            ),
            SizedBox(height: 30), // Add some spacing before footer
            Text(
              "Developed for 🇵🇰 with ❤️ by 🌍",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ));
    
       
    
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildInfoTile(
      {required IconData icon, required String text, IconData? trailingIcon, VoidCallback? fn}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background color for each row
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        trailing: trailingIcon != null
            ? Icon(trailingIcon, color: Colors.grey)
            : null,
        onTap:fn,
      ),
    );
  }
}
