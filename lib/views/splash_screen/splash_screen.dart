import 'dart:async';

import 'package:flutter/material.dart';

import 'package:to_do_app/views/sign_up_screen/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignupScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
     final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png', 
               width: screenWidth * 0.3,
              height: screenHeight * 0.2,
            ),
            SizedBox(height: screenHeight * 0.08),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Powered by',
                  style: TextStyle(
                    fontSize:screenWidth * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  ' Track',
                  style: TextStyle(
                    fontSize: screenWidth * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                Text(
                  'Pi',
                  style: TextStyle(
                    fontSize: screenWidth * 0.02,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
