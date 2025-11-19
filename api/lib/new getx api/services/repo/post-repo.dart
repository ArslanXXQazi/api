import 'package:dio/dio.dart';

class PostRepo
{

  Dio dio = Dio();

  Future<int>  postData (String id , String name, int year, double price,String CPUmodel, String hardDiskSize) async
  {
    String postUrl ='https://api.restful-api.dev/objects';
    try{
      final response = await dio.post(postUrl,
        data: [
          "id": id,
          "name":name,
          "data":{
          "year":year,
          "price":price,
          "CPU model":CPUmodel,
          "Hard disk size":hardDiskSize,
          }
        ]
      );

      return response.statusCode

    }
    catch(e){

    }
  }

}