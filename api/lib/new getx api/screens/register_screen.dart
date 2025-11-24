import 'package:flutter/material.dart';
import 'package:api/src/controller/components/black-text.dart';
import 'package:api/new getx api/components/common_widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // Title
              const Blacktext(
                text: 'Create Account',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              const Blacktext(
                text: 'Sign up to get started',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              
              const SizedBox(height: 40),
              
              // First Name Field
              const Blacktext(
                text: 'First Name',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: firstNameController,
                hintText: 'Enter your first name',
              ),
              
              const SizedBox(height: 20),
              
              // Last Name Field
              const Blacktext(
                text: 'Last Name',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: lastNameController,
                hintText: 'Enter your last name',
              ),
              
              const SizedBox(height: 20),
              
              // Password Field
              const Blacktext(
                text: 'Password',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
              ),
              
              const SizedBox(height: 20),
              
              // Confirm Password Field
              const Blacktext(
                text: 'Confirm Password',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: confirmPasswordController,
                hintText: 'Re-enter your password',
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off, color: Colors.grey),
              ),
              
              const SizedBox(height: 32),
              
              // Register Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your registration logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Blacktext(
                    text: 'Register',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // Already have account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Blacktext(
                    text: 'Already have an account? ',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to login screen
                    },
                    child: const Blacktext(
                      text: 'Login',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
