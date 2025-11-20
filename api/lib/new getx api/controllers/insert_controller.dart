import 'package:api/new%20getx%20api/screens/getx_get_screen.dart';
import 'package:api/new%20getx%20api/services/repo/post-repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsertController extends GetxController
{

  final TextEditingController idController= TextEditingController();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController yearController= TextEditingController();
  final TextEditingController priceController= TextEditingController();
  final TextEditingController cpuModelController= TextEditingController();
  final TextEditingController hardSizeController= TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;


  PostRepo postRepo = PostRepo();

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