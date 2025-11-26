
import 'package:dio/dio.dart';

class LoginRepo{

  Dio dio = Dio();

  Future<dynamic> loginRepo (String email,String password) async {

    try{
      String loginUrl = "https://etalk.mtai.live/api/user/login";
      final Data = {
        "email":email,
        "password":password,
        "fcm_token":"abcd"
      };
    }
    catch(e){

    }



  }

}