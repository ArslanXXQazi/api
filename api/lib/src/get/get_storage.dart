import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';


class InsertData extends StatelessWidget {
  const InsertData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Blacktext(text: "Insert Data",fontSize: 24,fontWeight: FontWeight.w700,),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [





        ],),
      ),
    );
  }
}
