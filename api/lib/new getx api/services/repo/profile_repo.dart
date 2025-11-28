import 'package:dio/dio.dart';

class ProfileRepo {

  Dio dio = Dio();

  Future<dynamic> profileRepo (String userId , String token) async {


    String profileUrl = "https://etalk.mtai.live/api/user/$userId/profile";

    

  }



}