

import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';

class PostInsertData extends StatefulWidget {
  const PostInsertData({super.key});

  @override
  State<PostInsertData> createState() => _PostInsertDataState();
}

class _PostInsertDataState extends State<PostInsertData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Blacktext(text: "POST API",fontSize: 34,fontWeight: FontWeight.w700),
        centerTitle: true,
      ),



    );
  }
}
