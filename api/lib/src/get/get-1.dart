import 'package:flutter/material.dart';


class GetApi1 extends StatelessWidget {
  const GetApi1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Get Api',
          style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

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
