
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override

  bool isLoading=false;
  String error ="";

  List <Map<String,dynamic>> userList = [];

  void fetchData () async {

    try
    {

    }
    catch (e)
    {
      isLoading=false;
      error=e.toString();
    }


  }


  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
