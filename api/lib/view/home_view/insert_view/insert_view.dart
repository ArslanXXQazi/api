import 'package:api/src/controller/components/custom_text_form_field.dart';
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

  TextEditingController nameController=TextEditingController();
  TextEditingController jobController=TextEditingController();

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
        print("Data Added");
         });
        }
      else
        {
        print("errrorrrorororrooor");
        }
    }
    catch(e)
    {
      setState(() {
    print(" Error $e");
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
            controller: nameController,
            hintText: "Enter Name",
            labelText: "Enter Name",
        ),
        SizedBox(height: 10),
        CustomTextFormField(
            controller: jobController,
            hintText: "Enter Job",
            labelText: "Enter Job",
        ),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: (){
              createUser(
                  nameController.text,
                  jobController.text,
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




