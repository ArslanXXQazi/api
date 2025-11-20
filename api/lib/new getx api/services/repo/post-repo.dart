import 'dart:convert';
import 'dart:io' show SocketException;

import 'package:dio/dio.dart';

class PostRepo
{

  Dio dio = Dio();

  PostRepo ()
  {
    dio.options.connectTimeout = const Duration(seconds: 8);
    dio.options.receiveTimeout = const Duration(seconds: 8);
  }


  Future<Map<String,dynamic>?> postData (String id , String name, int year, double price,String CPUmodel, String hardDiskSize) async
  {
    String postUrl ='https://api.restful-api.dev/objects';

    final data = json.encode({
      "id": id,
      "name":name,
      "data":{
        "year":year,
        "price":price,
        "CPU model":CPUmodel,
        "Hard disk size":hardDiskSize,
      }
    });
    try{
      final response = await dio.post(postUrl,
        data: data
      ).timeout(Duration(seconds: 8));

      if(response.statusCode==200 || response.statusCode==2001)
        {
          return response.data;
        }
      else
        {
          throw "Server Error : ${response.statusCode}";
        }

    } on DioException catch (e) {
      // Dio ka apna exception – sabse best handling yahan hoti hai
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception("Connection Timeout – Slow Internet");
      } else if (e.error is SocketException) {
        throw Exception("No Internet Connection");
      } else if (e.response != null) {
        throw Exception("Server Error: ${e.response?.statusCode}");
      } else {
        throw Exception("No Internet or Server Down");
      }
    } on SocketException catch (_) {
      throw Exception("No Internet Connection");
    }



    catch(e){
      throw Exception(e.toString().replaceAll("Exception: ", ""));
    }
  }

}