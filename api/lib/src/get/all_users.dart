
import 'package:api/src/controller/constants/apis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override

  bool isLoading=false;
  String error ="";

  List <Map<String,dynamic>> userList = [];

  void fetchData () async {

    try
    {
      setState(() {
        isLoading=true;
      });

      Dio dio =Dio();
      String getUrl = "${AppApis.baseUrl}${AppApis.getAllUser}";
      final response = await dio.get(getUrl);

      if(response.statusCode == 200 || response.statusCode == 201)
        {

        }


    }
    catch (e)
    {
      setState(() {
        isLoading=false;
      });
      error=e.toString();
    }


  }


  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
