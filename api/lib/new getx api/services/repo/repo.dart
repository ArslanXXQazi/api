
import 'dart:convert';

import 'package:dio/dio.dart';

class GetRepo
{

  Future <Map<String,dynamic>> getData () async
  {
    var dio = Dio();
    String getUrl ="https://dummyjson.com/users/1";
    final response = await dio.get(getUrl);
    final data = response.data;

    if (response.statusCode ==200)
      {
        return data;
      }
    else {
      throw Exception(response.statusMessage);
    }
  }

}