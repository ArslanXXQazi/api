
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RegisterRepo
{


  Dio dio = Dio();

  Future<dynamic> register(String name , String lastName, String email, String password) async {
    String registerUrl = "https://etalk.mtai.live/api/user/register";
    final data = {
      "name": name,
      "email": email,
      "password": password,
      "confirm_password": password,
    };

    try {
      final response = await dio.post(
        registerUrl,
        data: data,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("=====>> User registered successfully <<=====");
        return response.data;
      } else {
        print("=====>> Failed <<=====");
        return response.data;  // <-- return data even on non-200 status
      }

    } catch (e) {
      if (e is DioException) {
        print("STATUS CODE: ${e.response?.statusCode}");
        print("RESPONSE DATA: ${e.response?.data}");
        // Return the server response even in error
        return e.response?.data;
      }
      print("=====>> Failed ${e.toString()} <<=====");
      return null;
    }
  }


  Future<dynamic>sendOtp (String token) async {

   final  String sendUrl = "https://etalk.mtai.live/api/user/send-verification-code";
   final response = await dio.post(
     sendUrl,
     options: Options(
       headers: {'Authorization':token}
     )
   );



  }






}