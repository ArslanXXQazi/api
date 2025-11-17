

import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {



  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Blacktext(text: "User Detail",fontSize: 30,fontWeight: FontWeight.w700,),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Center(
            child: CircleAvatar(
              radius: 50,
            ),
          ),


        ],),
      ),
    );
  }
}
