// today's work for rosemary
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:to_do_app/constants/constants.dart';
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
        padding: EdgeInsets.symmetric(horizontal: Adaptive.w(10)),
        child: ListView(
          children: [
           
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: Adaptive.w(40),
                height: Adaptive.h(25),
              ),
            ),
          
            Center(
              child: 
              Textwid(
                  text: "Sign Up ",
                  size: 27,
                  textBold: FontWeight.w800,
                ),
            ),
           gapLarge,
           CustomTextField(
              controller: firstNameController,
              label: 'First Name',
              hintText: 'Enter Your First Name',
            ),
            CustomTextField(
              controller: lastNameController,
              label: 'Last Name',
              hintText: 'Enter Your Last Name',
            ),
            CustomTextField(
              controller: companyController,
              label: 'Company',
              hintText: 'Enter Your Company Name',
            ),

            _buildTitle('Date of Birth'),
            _buildDateField(),

            _buildTitle('Gender'),
            SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderRadio(
                    gender: 'Male',
                    selectedGender: selectedGender,
                    onChanged: (value) =>
                        setState(() => selectedGender = value),
                  ),
                
                 gap,
                  GenderRadio(
                    gender: 'Female',
                    selectedGender: selectedGender,
                    onChanged: (value) =>
                        setState(() => selectedGender = value),
                  ),
               
                gap,
                  GenderRadio(
                    gender: 'Other',
                    selectedGender: selectedGender,
                    onChanged: (value) =>
                        setState(() => selectedGender = value),
                  ),
                ],
              ),
            ),
          
           gapXL,

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
    return Padding(
      padding: const EdgeInsets.only(top: 9.0, bottom: 4),
      child: Text(
        text,
        style: TextStyle(
          fontSize: Adaptive.dp(.25),
          fontWeight: FontWeight.bold,
        ),
      ),
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
        Text(
          label,
          style: TextStyle(
            fontSize: Adaptive.dp(.25),
            fontWeight: FontWeight.bold,
          ),
        ),
      //  SizedBox(height: Adaptive.h(1)),
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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF82549C)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: gender,
              groupValue: selectedGender,
              onChanged: onChanged,
              activeColor: const Color(0xFF82549C),
            ),
            Text(
              gender,
              style: const TextStyle(color: Colors.black),
            ),
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
