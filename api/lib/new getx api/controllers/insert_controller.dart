import 'package:api/new%20getx%20api/screens/getx_get_screen.dart';
import 'package:api/new%20getx%20api/screens/otp_verification_screen.dart';
import 'package:api/new%20getx%20api/services/repo/post-repo.dart';
import 'package:api/new%20getx%20api/services/repo/register_repo.dart';
import 'package:dio/dio.dart';
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

      print("====> Response: $response");
      print("====> Response Type: ${response.runtimeType}");
      
      if(response != null)
        {
          // Check if response has message
          if(response ['message'] != null) {
            Get.snackbar(
              response['status']?.toString().toUpperCase() ?? "INFO",
              response['message'].toString(),
              backgroundColor: response['status']=='success'?  Colors.green : Colors.red,
              colorText: Colors.white,
            );
          }
          
          // Navigate to OTP screen if registration is successful
          // Check multiple possible success indicators
          if(response['status'] == 'success' || 
             response['status'] == true || 
             response['success'] == true) {
            print("====> Navigating to OTP screen");
            await Future.delayed(Duration(milliseconds: 500)); // Small delay for snackbar
            Get.to(() => OtpVerificationScreen(email: emailController.text));
          }
        }

    }
    catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar("Error", errorMessage.value,
          backgroundColor: Colors.red, colorText: Colors.white);
      isLoading.value=false;
    }

  }

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