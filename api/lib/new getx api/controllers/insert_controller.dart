import 'package:api/new%20getx%20api/screens/otp_verification_screen.dart';
import 'package:api/new%20getx%20api/services/repo/post-repo.dart';
import 'package:api/new%20getx%20api/services/repo/register_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertController extends GetxController
{

  final TextEditingController idController= TextEditingController();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController lastNameController= TextEditingController();
  final TextEditingController yearController= TextEditingController();
  final TextEditingController priceController= TextEditingController();
  final TextEditingController cpuModelController= TextEditingController();
  final TextEditingController hardSizeController= TextEditingController();
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();
  final TextEditingController confirmPassController= TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var userToken = ''.obs;
  PostRepo postRepo = PostRepo();
  RegisterRepo registerRepo = RegisterRepo();

  Future <void> registerUser () async {
    try{

      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          confirmPassController.text.isEmpty
      ) {
        Get.snackbar("Error", "Please fill all fields first");
        return;
      }

      if (passwordController.text != confirmPassController.text) {
        Get.snackbar("Error", "Passwords do not match");
        return;
      }

      if (passwordController.text.length <8 && confirmPassController.text.length <8) {
        Get.snackbar("Error", "Passwords must be 8 digit");
        return;
      }

      isLoading.value=true;
      final response = await registerRepo.register(
        nameController.text,
        lastNameController.text,
        emailController.text,
        passwordController.text,
      );

      isLoading.value=false;

      print("====> Registration Response: $response");
      
      if(response != null && response['status'] == 'success')
      {
        //Store token for future use
        if(response['token'] != null) {
          userToken.value = response['token'];
          print("====> Token saved: ${userToken.value.substring(0, 20)}...");
        }

        // Show success message
        Get.snackbar(
          "SUCCESS",
          response['message'].toString(),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Send OTP automatically
        print("====> Sending OTP...");
        await sendOtp();

        // Navigate to OTP screen
        print("====> Navigating to OTP screen");
        Get.to(() => OtpVerificationScreen(
          email: emailController.text,
          token: userToken.value,
        ));

      }
      else if(response != null && response['message'] != null)
      {
        // Show error message
        Get.snackbar(
          "ERROR",
          response['message'].toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

    }
    catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar("Error", errorMessage.value,
          backgroundColor: Colors.red, colorText: Colors.white);
      isLoading.value=false;
    }

  }

  //send otp function
  Future <void> sendOtp () async {

    try{

      if(userToken.value.isEmpty)
        {
          print('=====>>> USER TOKEN IS NO AVAILABLE');
          return;
        }

      final otpResponse = await registerRepo.sendOtp(userToken.value);
      if(otpResponse!=null)
        {
          print("OTP SEND SUCCESSFULLY");
          Get.snackbar("Success", "otp send successfully to ${emailController.text}");
        }
      else{
        print('FAILED TO SEND OTP');
      }

    }
    catch(e){
      print("====> OTP Error: ${e.toString()}");
    }

  }


  //verification otp function
  Future<void> verifyOtp() async {

    try{

    }
    catch(e){
      
    }

  }


  //insert data  function
  Future<void> insertData() async {

      try
          {

            if (nameController.text.isEmpty ||
                yearController.text.isEmpty ||
                priceController.text.isEmpty ||
                cpuModelController.text.isEmpty ||
                hardSizeController.text.isEmpty)
            {
              Get.snackbar("Error", "Please fill all fields first");
              return;
            }



            errorMessage.value = '';
            isLoading.value=true;
            final result = await  postRepo.postData(
                idController.text,
                nameController.text,
                int.parse(yearController.text),
                double.parse(priceController.text),
                cpuModelController.text,
                hardSizeController.text);

            if (result !=null)
            {
              Get.snackbar("Success", "Data Insert Successfully");
            }
            else
            {
              Get.snackbar("Error", "Failed to insert Data");
            }
            isLoading.value=false;
          }
      catch(e){
        isLoading.value = false;

        String errorMsg = e.toString().replaceAll("Exception: ", "");

        // No internet ya timeout ke liye special message
        if (errorMsg.contains("Internet") || errorMsg.contains("Timeout") || errorMsg.contains("Socket")) {
          errorMessage.value = "No Internet Connection!\nPlease check your network and try again.";
          Get.snackbar("No Internet", "Check your connection", backgroundColor: Colors.red, colorText: Colors.white);
        } else {
          errorMessage.value = errorMsg;
        }
      }

  }
}