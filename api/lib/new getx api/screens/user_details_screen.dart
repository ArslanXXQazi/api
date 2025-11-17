

import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Blacktext(text: "User Detail"),),
      body: Column(children: [

        CircleAvatar(
          radius: 30,
        )


      ],),
    );
  }
}
