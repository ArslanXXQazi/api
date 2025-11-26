import 'package:get_storage/get_storage.dart';

class GetStorageService {

  static final box = GetStorage();

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


}