import 'package:dio/dio.dart';

class ProfileRepo {

  Dio dio = Dio();

  Future<dynamic> profileRepo (String userId , String token) async {

    try
    {

      String profileUrl = "https://etalk.mtai.live/api/user/$userId/profile";
      final response = await dio.get(
          profileUrl,
          options: Options(
            headers: {"Authorization": "Bearer $token"}
          ));

      if (response.statusCode == 200 || response.statusCode==201)
        {
          print("===>> Data fetch Successfully");
          return response.data;
        }
      else
        {
          print("===>> Data fetch Faild");
          return response.data;
        }


    }
    catch(e)
    {
      print("===>> Data fetch Faild ${e.toString()}");
      return null;
    }

  }



}