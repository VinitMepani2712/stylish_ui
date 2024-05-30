import 'package:flutter/material.dart';
import 'package:stylish_ui/Auth/login_screen.dart';
import 'package:stylish_ui/widget/widget_support.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/on_board_images/welcome_screen.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "You want Authentic, here you go!",
                  textAlign: TextAlign.center,
                  style: AppWidget.welcomeScreenTextStyle(),
                ),
                SizedBox(height: 30),
                Text(
                  "Find it here, buy it now!",
                  textAlign: TextAlign.center,
                  style: AppWidget.welcomeScreenSubTextStyle(),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xffF83758),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
