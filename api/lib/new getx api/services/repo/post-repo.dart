import 'dart:convert';

import 'package:dio/dio.dart';

class PostRepo
{

  Dio dio = Dio();
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
      );

      if(response.statusCode==200 || response.statusCode==2001)
        {
          return response.data;
        }
      else
        {
          throw "Failed";
        }

    }
    catch(e){
      print(e.toString());
    }
  }

}