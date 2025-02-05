import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedGender;
  DateTime selectedDate = DateTime.now();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController dateOfBirthController =
      TextEditingController(text: 'dd/mm/yy');

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: screenWidth * 0.3,
                height: screenHeight * 0.2,
              ),
            ),
          //  _buildTitle('Sign Up', screenWidth),
   Center(
     child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
   ),
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

            _buildTitle('Date of Birth', screenWidth),
            _buildDateField(),

            _buildTitle('Gender', screenWidth),
            SingleChildScrollView(
           //   scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderRadio(
                    gender: 'Male',
                    selectedGender: selectedGender,
                    onChanged: (value) => setState(() => selectedGender = value),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  GenderRadio(
                    gender: 'Female',
                    selectedGender: selectedGender,
                    onChanged: (value) => setState(() => selectedGender = value),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  GenderRadio(
                    gender: 'Other',
                    selectedGender: selectedGender,
                    onChanged: (value) => setState(() => selectedGender = value),
                  ),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.03),

            SignUpButton(onPressed: () {
              // Handle sign-up logic
            }),

            SizedBox(height: screenHeight * 0.05),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
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
    required this.controller,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
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
        const SizedBox(height: 10),
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
    required this.gender,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF82549C)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
         //  mainAxisSize: MainAxisSize.min,
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

  const SignUpButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF82549C),
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.25, vertical: 15),
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
