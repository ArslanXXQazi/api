import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post API",style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}




