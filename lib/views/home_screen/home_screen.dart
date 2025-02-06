import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/gen/assets.gen.dart';
import 'package:to_do_app/views/widgets/textwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Adaptive.h(1),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(5)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                gapLarge,
                Textwid(
                  text: "Hi, Paulwalker",
                  size: 18,
                  textBold: FontWeight.w500,
                ),
                gap,
                Image.asset(Assets.images.handlogo.path)
              ],
            )
          ],
        ),
      ),
    );
  }
}
