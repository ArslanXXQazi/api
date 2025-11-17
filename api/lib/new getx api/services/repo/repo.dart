
import 'dart:convert';

import 'package:dio/dio.dart';

class GetRepo
{

  Future<List<dynamic>> getData() async
  {
    var dio = Dio();
    String getUrl ="https://dummyjson.com/users";
    final response = await dio.get(getUrl);
    final data = response.data;

    if (response.statusCode ==200)
      {
        return data['users'];
      }
    else {
      throw Exception(response.statusMessage);
    }
  }

}