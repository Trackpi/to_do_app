// today's work for rosemary
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/constants/constants.dart';
import 'package:to_do_app/gen/assets.gen.dart';
import 'package:to_do_app/views/home_screen/home_screen.dart';
import 'package:to_do_app/views/widgets/textwidget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? selectedGender;
  DateTime selectedDate = DateTime.now();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController dateOfBirthController =
      TextEditingController(text: 'dd/mm/yy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView(
          children: [
            Center(
              child: Image.asset(
                Assets.images.logo.path,
                width: 40.w,
                height: 20.h,
              ),
            ),
            Center(
              child: Textwid(
                text: "Sign Up ",
                size: 24,
                textBold: FontWeight.w800,
              ),
            ),
            gapLarge,
            CustomTextField(
              controller: firstNameController,
              label: 'First Name',
              hintText: 'Enter Your First Name',
            ),
            gap,
            CustomTextField(
              controller: lastNameController,
              label: 'Last Name',
              hintText: 'Enter Your Last Name',
            ),
            gap,
            CustomTextField(
              controller: companyController,
              label: 'Company',
              hintText: 'Enter Your Company Name',
            ),
            gap,
            _buildTitle('Date of Birth'),
            gap,
            _buildDateField(),
            gap,
            _buildTitle('Gender'),
            gap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderRadio(
                  gender: 'Male',
                  selectedGender: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                GenderRadio(
                  gender: 'Female',
                  selectedGender: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                GenderRadio(
                  gender: 'Other',
                  selectedGender: selectedGender,
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
              ],
            ),
            gapLarge,
            gapLarge,
            SignUpButton(
              onPressed: () {
                // TODO: signup Logic

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
            ),
            gapXL
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Textwid(
      text: text,
      textBold: FontWeight.bold,
      size: 16,
    );
  }

  Widget _buildDateField() {
    return TextField(
      controller: dateOfBirthController,
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today, color: Color(0xFF82549C)),
          onPressed: _selectDate,
        ),
      ),
      onTap: _selectDate,
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateOfBirthController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year.toString().substring(2)}";
      });
    }
  }
}

// ==================== REUSABLE WIDGETS ====================

// Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Textwid(
          text: label,
          size: 16,
          textBold: FontWeight.bold,
        ),

        gap,

        TextField(
          controller: controller,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        //   SizedBox(height: Adaptive.h(1.5)),
        gap,
      ],
    );
  }
}

// Gender Radio Widget
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
    return Flexible(
      flex: 1,
      child: Container(
        height: Adaptive.h(5),
        width: Adaptive.w(25),
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2)),
        decoration: BoxDecoration(
          color: pureWhite,
          border: Border.all(color: const Color(0xFF82549C)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // circular button
            // TODO: Logic to Select
            Container(
              width: Adaptive.w(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: pureBlack,
                  width: 2,
                ),
              ),
            ),

            gap,
            Textwid(
              text: gender,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}

// Sign Up Button Widget
class SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignUpButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF82549C),
          padding:
              EdgeInsets.symmetric(horizontal: Adaptive.w(9), vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
