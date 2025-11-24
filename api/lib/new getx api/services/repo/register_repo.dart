
import 'dart:convert';

import 'package:dio/dio.dart';

class RegisterRepo
{


  Dio dio = Dio();
  Future<void> register(String name , String lastName, String email, String password) async
  {

    String registerUrl = "https://etalk.mtai.live/api/user/register";
    final data = json.encode({

      "name":name,
      "email":email,
      "password":password,
      "confirm_password":password,

    });



    try{

      final response = await dio.post(
          registerUrl,
          data: data
      );

      if(response.statusCode==200 || response.statusCode==201)
        {

        }


    }
    catch(e){

    }


  }





}