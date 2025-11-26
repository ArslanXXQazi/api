
import 'package:dio/dio.dart';

class LoginRepo{

  Dio dio = Dio();

  Future<dynamic> loginRepo (String email,String password) async {

    try{
      String loginUrl = "https://etalk.mtai.live/api/user/login";
      final data =
      {
        "email":email,
        "password":password,
        "fcm_token":"abcd"
      };

      final response = await dio.request(loginUrl, data: data);
      if(response.statusCode==200||response.statusCode==201)
        {
          print("=========>> LOGIN SUCCESSFULLY");
          return response.data;
        }
      else{
        print("=========>> LOGIN FAILD");
        return response.data;
      }
    }
    catch(e){

      print("=========>> LOGIN FAILD ${e.toString()}");

    }

  }

}