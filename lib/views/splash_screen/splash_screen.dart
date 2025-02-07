import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/gen/assets.gen.dart';
import 'package:to_do_app/views/sign_up_screen/signup_screen.dart';
import 'package:to_do_app/views/widgets/textwidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Duration of the zoom effect
    );

    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation
    _controller.forward();

    // Navigate to the SignUp screen after the animation
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignupScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Always dispose of controllers
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
              child: Image.asset(
                Assets.images.logo.path,
                width: Adaptive.w(40),
                height: Adaptive.h(30),
              ),
            ),
            gapXXL,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textwid(
                  text: "Powered by ",
                  size: 18,
                  textBold: FontWeight.w500,
                ),
                Textwid(
                  text: " Track",
                  size: 18,
                  textBold: FontWeight.w500,
                  textColor: Colors.orangeAccent,
                ),
                Textwid(
                  text: "Pi",
                  size: 18,
                  textBold: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
