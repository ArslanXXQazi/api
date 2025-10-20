

import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';

class PostInsertData extends StatefulWidget {
  const PostInsertData({super.key});

  @override
  State<PostInsertData> createState() => _PostInsertDataState();
}

class _PostInsertDataState extends State<PostInsertData> {
  @override


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
        child: Column(children: [


          


        ],),
      ),


    );
  }
}
