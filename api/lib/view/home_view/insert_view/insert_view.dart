import 'package:api/src/controller/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {

  TextEditingController nameTextController=TextEditingController();
  TextEditingController jobTextController=TextEditingController();

  Future<void> createUser(String name, String job)
  async{

    final String apiUrl= "https://reqres.in/api/users";

    try{
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({"name":name, "job":job})
      );

      if(response.statusCode==201)
        {
         setState(() {
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('User Created Successfully!')));
         });
        }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to create user!')));
        }
    }
    catch(e)
    {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$e")));
      });
    }


  }



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
      body: Column(children: [

        CustomTextFormField(
          controller: nameTextController,
          hintText: "Enter Name",
          labelText: "Enter Name",
        ),
        
        CustomTextFormField(
            controller: jobTextController,
            hintText: "Enter Job",
            labelText: "Enter Job",
        ),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: (){
              createUser(
                  nameTextController.text,
                  jobTextController.text,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text("ADD",style: TextStyle(fontSize: 20,color: Colors.white),))
      ],),
    );
  }
}




