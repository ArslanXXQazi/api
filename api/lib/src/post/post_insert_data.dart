

import 'package:api/src/controller/components/black-text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostInsertData extends StatefulWidget {
  const PostInsertData({super.key});

  @override
  State<PostInsertData> createState() => _PostInsertDataState();
}

class _PostInsertDataState extends State<PostInsertData> {
  @override

  bool isLoading = false;
  String error = '';

  void insertData () async
  {

    String postUrl = 'https://api.restful-api.dev/objects';
    final Map<String,dynamic> requestBody = {
      "name" : nameController.text,
      "year" : int.parse(yearController.text),
      "price": double.parse(priceController.text),
      "CPU model" : cpuModelController.text,
      "Hard disk size" : hardDiskSizeController.text
    };
    Dio dio = Dio();
  final response = await  dio.post(
        postUrl,
        data: requestBody
    );

  if (response.statusCode == 200 || response.statusCode== 201)
    {
      
    }


  }




  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController cpuModelController = TextEditingController();
  final TextEditingController hardDiskSizeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Blacktext(text: "POST API",fontSize: 34,fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(controller: nameController,decoration: InputDecoration(hintText: "Enter Name"),),
            SizedBox(height: 20),
            TextFormField(controller: yearController,decoration: InputDecoration(hintText: "Enter Year"),),
            SizedBox(height: 20),
            TextFormField(controller: priceController,decoration: InputDecoration(hintText: "Enter Price"),),
            SizedBox(height: 20),
            TextFormField(controller: cpuModelController,decoration: InputDecoration(hintText: "Enter CPU Model"),),
            SizedBox(height: 20),
            TextFormField(controller: hardDiskSizeController,decoration: InputDecoration(hintText: "Enter Hard Size"),),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){}, child: Blacktext(text: "SAVE",fontSize: 16,)),
          ],),
        ),
      ),


    );
  }
}
