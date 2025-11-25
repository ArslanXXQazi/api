import 'package:api/new%20getx%20api/components/common_widgets/spinner.dart';
import 'package:api/new%20getx%20api/controllers/insert_controller.dart';
import 'package:flutter/material.dart';
import 'package:api/src/controller/components/black-text.dart';
import 'package:api/new getx api/components/common_widgets/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    InsertController insertController = Get.put(InsertController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
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

                  const SizedBox(height: 30),

                  // First Name Field
                  const Blacktext(
                    text: 'First Name',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: insertController.nameController,
                    hintText: 'Enter your first name',
                  ),

                  const SizedBox(height: 10),

                  const Blacktext(
                    text: 'Email',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: insertController.emailController,
                    hintText: 'Enter your last email',
                  ),


                  const SizedBox(height: 10),
                  // Password Field
                  const Blacktext(
                    text: 'Password',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: insertController.passwordController,
                    hintText: 'Enter your password',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // Confirm Password Field
                  const Blacktext(
                    text: 'Confirm Password',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: insertController.confirmPassController,
                    hintText: 'Re-enter your password',
                    obscureText: false,
                  ),

                  const SizedBox(height: 15),

                  // Register Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        insertController.registerUser();
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
          Obx((){
            return insertController.isLoading.value?
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(child: Spinner()),
            ) : SizedBox.shrink();

          })
        ],
      ),
    );
  }
}
