import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/constants/constants.dart';

class Textwid extends StatelessWidget {
  final String text;
  final int size;
  final FontWeight textBold;
  final Color textColor;

  const Textwid({
    super.key,
    required this.text,
    this.size = 15,
    this.textBold = FontWeight.normal,
    this.textColor = pureBlack,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size.sp,
        fontWeight: textBold,
        color: textColor,
      ),
    );
  }
}
