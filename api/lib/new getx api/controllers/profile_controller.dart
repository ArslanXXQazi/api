import 'package:api/new%20getx%20api/services/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
{
  var isLoading = false.obs;
  var profileData = {}.obs;



  Future <void> fetchProfileData (String userId, String token) async
  {

    ProfileRepo profileRepo = ProfileRepo();

    try
    {
      isLoading.value=true;

      final response = await profileRepo.profileRepo(userId, token);

      if(response !=null && response['']=='success')
      {
        profileData.value= response['data'];
        print("Profile Loaded Successfully");
      }
      else {
        Get.snackbar(
          "ERROR",
          response?['message'] ?? "Failed to load profile",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value=false;
      }
      isLoading.value=false;


    }
    catch(e)
    {
      isLoading.value=false;
      Get.snackbar(
        "ERROR",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }


  }


}