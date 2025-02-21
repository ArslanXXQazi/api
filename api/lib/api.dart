import 'dart:convert';

import 'package:api/src/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  @override

  List <UserModel> userList=[];

  Future<void> fetchData ()
  async{

    final url=Uri.parse('https://reqres.in/api/unknown');
    final response= await http.get(url);
    if(response.statusCode==200)
      {
        final data=json.decode(response.body);
       setState(() {
         userList=(data['data' as List]).
         map((user)=>UserModel.fromMap(user)).toList();
       });
      }
    else
      {
        print("ERRRRRROROOROROROORR");

      }

    void initState()
    {
      super.initState();
      fetchData();

    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api'),
        centerTitle:true,
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context,index){
          return Column(children: [
            Text(userList[index].id.toString()),
            Text(userList[index].name.toString()),
          ],);
        },
      ),
    );
  }
}
