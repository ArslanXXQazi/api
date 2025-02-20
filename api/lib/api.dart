import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  @override

  Future<void> fetchData ()
  async{

    final url=Uri.parse('https://reqres.in/api/unknown');
    final response= await http.get(url);

  }


  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
