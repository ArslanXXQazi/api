import 'package:get_storage/get_storage.dart';

class GetStorageService {

  static final box = GetStorage();


  /// ===============>>> token save method

  static  saveToken (String token)
  {
    box.write("token",token);
  }

  static String? getToken ()
  {
   return  box.read("token");
  }

  static deleteToken()
  {
    box.remove("token");
  }


  // ==========>> User_Id save method

  static saveUserId (String userId)
  {
    box.write("userId", userId);
  }

  static getUserId ()
  {
    box.read("userId");
  }

  static deleteUserId ()
  {
    box.read("userId");
  }

}