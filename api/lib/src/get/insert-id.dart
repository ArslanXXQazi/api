import 'package:api/src/controller/components/black-text.dart';
import 'package:api/src/get/get-1.dart';
import 'package:flutter/material.dart';

class InsertId extends StatelessWidget {
   InsertId({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [

          TextFormField(controller: textEditingController,),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>GetApi1(id: int.parse(textEditingController.text),)));
          }, child: Blacktext(text: "Check")),


        ],),
      ),


    );
  }
}
