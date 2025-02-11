
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/views/widgets/textwidget.dart';

class GenderRadio extends StatelessWidget {
  final String gender;
  final String? selectedGender;
  final ValueChanged<String?> onChanged;

  const GenderRadio({
    super.key,
    required this.gender,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.h(5),
      width: Adaptive.w(26),
      // padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF82549C)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio<String>(
            value: gender,
            groupValue: selectedGender,
            onChanged: onChanged,
            activeColor: Color(0xFF82549C),
          ),
          Textwid(
            text: gender,
            size: 13,
            textBold: FontWeight.w800,
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}
