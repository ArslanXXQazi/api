import 'package:flutter/material.dart';


class GetApi1 extends StatelessWidget {
  const GetApi1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Get Api',
          style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Center(child: Column(children: [

        Text(
          'Api',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.w700
          ),
        ),


      ],),),
    );
  }
}
