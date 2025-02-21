import 'dart:convert';

import 'package:api/src/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  SupportModel? supportData;
  void initState()
  {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async
  {

    final url = Uri.parse('https://reqres.in/api/unknown');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        supportData = SupportModel.fromMap(data['support']);
      });
    } else {
      print("Error fetching data");
    }


  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Center(
        child: supportData == null
            ? CircularProgressIndicator() // ✅ Data load hone tak loader show hoga
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(supportData!.text ?? "No Text",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(supportData!.url ?? "No URL",
                style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}



