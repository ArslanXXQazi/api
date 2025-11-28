import 'package:api/new%20getx%20api/services/repo/profile_repo.dart';
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

      



    }
    catch(e)
    {

    }


  }


}