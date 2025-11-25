import 'package:api/new%20getx%20api/controllers/insert_controller.dart';
import 'package:flutter/material.dart';
import 'package:api/src/controller/components/black-text.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String email;
  final String token;
  
  const OtpVerificationScreen({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {

    // Get the controller instance
    final InsertController insertController = Get.find<InsertController>();
    final TextEditingController otpController = TextEditingController();

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Icon
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mail_outline,
                  size: 50,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 30),

              // Title
              const Blacktext(
                text: 'OTP Verification',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),

              const SizedBox(height: 12),

              // Subtitle
              Blacktext(
                text: 'We have sent a verification code to',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),

              const SizedBox(height: 4),

              Blacktext(
                text: email,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),

              const SizedBox(height: 40),

              // OTP Input Fields

              TextFormField(
                controller: otpController,
                keyboardType: TextInputType.numberWithOptions(),
                maxLength: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey,width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.blue,width: 2)
                  ),
                  hintText: "Enter 4 digit otp",
                ),
              ),

              const SizedBox(height: 30),

              // Resend Code
              Obx((){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Blacktext(
                      text: "Didn't receive the code? ",
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    GestureDetector(
                      onTap: () {
                        insertController.sendOtp();
                      },
                      child: insertController.sendLoading.value?
                      const Blacktext(
                        text: 'Resending...',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ):
                      const Blacktext(
                        text: 'Resend',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                );
              }),

              const SizedBox(height: 40),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: Obx(() => ElevatedButton(
                  onPressed: (){
                    insertController.verifyOtp(email, otpController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: insertController.isLoading.value? Colors.black : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: insertController.isLoading.value
                    ? const Blacktext(text: "Verifying...",fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,)
                    : const Blacktext(
                        text: 'Verify OTP',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

