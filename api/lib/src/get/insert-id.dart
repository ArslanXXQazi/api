import 'package:api/src/controller/components/black-text.dart';
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
        ElevatedButton(onPressed: (){}, child: Blacktext(text: "Check")),


      ],),


    );
  }
}
