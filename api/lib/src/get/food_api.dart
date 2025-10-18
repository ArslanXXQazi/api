import 'package:api/src/controller/components/black-text.dart';
import 'package:api/src/controller/constants/apis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FoodApi extends StatefulWidget {
  const FoodApi({super.key});

  @override

  State<FoodApi> createState() => _FoodApiState();
}

class _FoodApiState extends State<FoodApi> {
  @override


  bool isLoading = false;
  String error = "";

  void fetchData  () async
  {

    try
    {

      isLoading=true;
      Dio dio = Dio();
      String getFoodUrl = "${AppApis.foodBase}${AppApis.allFood}";
      final response = dio.get(getFoodUrl);
      



    }
    catch(e)
    {
      isLoading=false;
      error = e.toString();
    }

  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Blacktext(text: "FOOD API",fontSize: 30,fontWeight: FontWeight.w600,color: Colors.green,),
      ),
    );
  }
}
