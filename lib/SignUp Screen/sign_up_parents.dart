import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home Page Screen/home_page.dart';

class PSignUpScreen extends StatefulWidget {
  const PSignUpScreen({super.key});

  @override
  State<PSignUpScreen> createState() => _PSignUpScreenState();
}

class _PSignUpScreenState extends State<PSignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _childStudentIdController =
      TextEditingController();

  String? _selectedRelationship;
  bool _agreedToTerms = false;
  bool _isPasswordVisible = false;

  // Dropdown items list
  final List<String> _relationships = [
    'Parent',
    'Guardian',
    'Other Family Member',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _childStudentIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 1),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 10),
              child: Image.asset(
                'assets/images/v.png',
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 0.1),
            const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'by creating a free account.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Full Name Input
            _buildTextField(
              controller: _fullNameController,
              hintText: 'Full name',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 10),

            // Valid Email Input
            _buildTextField(
              controller: _emailController,
              hintText: 'Valid email',
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),

            // Phone Number Input
            _buildTextField(
              controller: _phoneNumberController,
              hintText: 'Phone number',
              icon: Icons.phone_android_outlined,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),

            // Strong Password Input
            _buildTextField(
              controller: _passwordController,
              hintText: 'Strong password',
              icon: Icons.lock_outline,
              obscureText: !_isPasswordVisible,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            const SizedBox(height: 10),

            // Relationship Dropdown
            _buildDropdownField(),
            const SizedBox(height: 10),

            // Child's Student ID Input
            _buildTextField(
              controller: _childStudentIdController,
              hintText: 'Child\'s Student ID',
              icon: Icons.credit_card_outlined,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),

            // Terms and Conditions Checkbox
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (bool? newValue) {
                    setState(() {
                      _agreedToTerms = newValue ?? false;
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Text.rich(
                  TextSpan(
                    text: 'By checking the box you agree to our ',
                    style: TextStyle(color: Colors.grey[700]),
                    children: [
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextSpan(
                        text: 'Conditions',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Next Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4263F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Already a member? Login in
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already a member?',
                  style: TextStyle(color: Colors.grey),
                ),
                // Login Button
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'Login in',
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(icon, color: Colors.grey),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ), // Padding inside the text field
        ),
      ),
    );
  }

  // Dropdown Field widget function
  Widget _buildDropdownField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedRelationship,
        hint: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            'Relationship',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.people_outline, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        items:
            _relationships.map((String relation) {
              return DropdownMenuItem<String>(
                value: relation,
                child: Text(relation),
              );
            }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedRelationship = newValue;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Please select your relationship';
          }
          return null;
        },
      ),
    );
  }
}
