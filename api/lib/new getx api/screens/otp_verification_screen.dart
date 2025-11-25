import 'package:api/new%20getx%20api/components/common_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  final String token;
  
  const OtpVerificationScreen({
    super.key,
    required this.email,
    required this.token,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {


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
                text: widget.email,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),

              const SizedBox(height: 40),

              // OTP Input Fields


              const SizedBox(height: 30),

              // Resend Code
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Blacktext(
                    text: "Didn't receive the code? ",
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Add resend OTP logic later
                      Get.snackbar(
                        "INFO",
                        'Resend OTP feature - Coming soon!',
                        backgroundColor: Colors.blue,
                        colorText: Colors.white,
                      );
                    },
                    child: const Blacktext(
                      text: 'Resend',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Blacktext(
                    text: 'Verify OTP',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // // Timer (Optional - for future implementation)
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 16,
              //     vertical: 12,
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.blue.withOpacity(0.1),
              //     borderRadius: BorderRadius.circular(8),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       const Icon(
              //         Icons.access_time,
              //         size: 18,
              //         color: Colors.blue,
              //       ),
              //       const SizedBox(width: 8),
              //       Blacktext(
              //         text: 'Code expires in 05:00',
              //         fontSize: 14,
              //         fontWeight: FontWeight.w500,
              //         color: Colors.blue[700],
              //       ),
              //     ],
              //   ),
              // ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

