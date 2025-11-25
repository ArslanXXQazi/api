import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Blacktext(text: "Welcome Back",fontWeight: FontWeight.bold,fontSize: 45,color: Colors.green,),),
    );
  }
}
