import 'package:api/src/controller/components/black-text.dart';
import 'package:api/src/get/get-1.dart';
import 'package:flutter/material.dart';

class InsertId extends StatelessWidget {
  const InsertId({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: Column(children: [

        TextFormField(controller: textEditingController,),
        SizedBox(height: 20),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>GetApi1(id: double.parse(),)));
        }, child: Blacktext(text: "Check")),


      ],),


    );
  }
}
