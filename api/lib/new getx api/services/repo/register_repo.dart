
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RegisterRepo
{
  Dio dio = Dio();

  //registration repo
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


  //send otp code repo
  Future<dynamic>sendOtp (String token) async {
    final String sendUrl = "https://etalk.mtai.live/api/user/send-verification-code";
    try{
      final response = await dio.post(
        sendUrl,
        options: Options(
        headers: {'Authorization': 'Bearer $token'}
        )
      );
      if(response.statusCode==200 || response.statusCode==201)
        {
          print("======>> OTP SEND SUCCESSFULLY <<=======");
          print("OTP Response: ${response.data}");
          return response.data;
        }
      else{
        print("======>> OTP SEND Failed <<=======");
        print("OTP Response: ${response.data}");
        return response.data;
      }
    }
    catch(e){
      print("======>> OTP SEND Failed <<=======");
      print(e.toString());
      return null;
    }
  }


  //verify otp repo
  Future<dynamic>verifyOtp (String email, int otp) async {

    final String verifyUrl = "https://etalk.mtai.live/api/user/verify-otp";

    final data = {
      "email":email,
      "verification_code":otp
    };

    try{
      final response = await dio.post(
          verifyUrl,
          data: data
      );

      if (response.statusCode==200 || response.statusCode==201)
        {
          print("===>> OTP VERIFIED");
          return response.data;
        }
      else{
        print("===>> OTP VERIFICATION FAILED");
        return response.data;
      }
    }
    catch(e){
      print("===>> OTP VERIFICATION FAILED ${e.toString()}");
    }
  }

}