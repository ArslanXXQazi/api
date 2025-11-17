

import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {

  final Map user ;

  const UserDetailsScreen({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Blacktext(text: "${user['firstName']}",fontWeight: FontWeight.w700,fontSize: 25,),
          Blacktext(text: " ${user['lastName']}",fontWeight: FontWeight.w700,fontSize: 25,),
        ],
      )
        ,centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

          Center(
            child: CircleAvatar(
              radius: 50,
             backgroundImage: NetworkImage(user['image']),
            ),
          ),
          SizedBox(height: 30),
          Blacktext(text: "Blood Group : ${user['bloodGroup']}"),
            SizedBox(height: 10),
          Blacktext(text: "Height : ${user['height']}"),
            SizedBox(height: 10),
          Blacktext(text: "Weight : ${user['weight']}"),
            SizedBox(height: 10),
          Blacktext(text: "Lat : ${user['address']['coordinates']['lat']}"),
            SizedBox(height: 10),
          Blacktext(text: "Lng : ${user['address']['coordinates']['lng']}"),

        ],),
      ),
    );
  }
}
