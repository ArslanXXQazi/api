// import 'dart:convert';
//
// import 'package:api/src/user_model/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
// class Api extends StatefulWidget {
//   const Api({super.key});
//
//   @override
//   State<Api> createState() => _ApiState();
// }
//
// class _ApiState extends State<Api> {
//   @override
//
//   List <UserModel> userList=[];
//
//   Future<void> fetchData ()
//   async{
//
//     final url=Uri.parse('https://reqres.in/api/unknown');
//     final response= await http.get(url);
//     if(response.statusCode==200)
//       {
//         final data=json.decode(response.body);
//        setState(() {
//          userList=(data['data' as List]).
//          map((user)=>UserModel.fromMap(user)).toList();
//        });
//       }
//     else
//       {
//         print("ERRRRRROROOROROROORR");
//
//       }
//
//     @override
//     void initState() {
//       // TODO: implement initState
//       super.initState();
//       fetchData();
//     }
//   }
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Api'),
//         centerTitle:true,
//       ),
//       body: ListView.builder(
//         itemCount: userList.length,
//         itemBuilder: (context,index){
//           return Column(children: [
//             Text(userList[index].id.toString()),
//             Text(userList[index].name.toString()),
//             Text(userList[index].year.toString()),
//             Text(userList[index].color.toString()),
//             Text(userList[index].pantone_value.toString()),
//           ],);
//         },
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api/src/user_model/user_model.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List<UserModel> userList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://reqres.in/api/unknown');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      setState(() {
        List<dynamic> dataList = data['data'];
        userList = dataList.map((user) => UserModel.fromMap(user)).toList();
      });
    } else {
      print("Error fetching data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
        centerTitle: true,
      ),
      body: userList.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loader until data is fetched
          : ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(userList[index].name ?? 'No Name'),
              subtitle: Text("Year: ${userList[index].year}"),
              leading: CircleAvatar(
                backgroundColor: userList[index].color ?? Colors.grey,
                child: Text(userList[index].id),
              ),
              trailing: Text(userList[index].pantone_value ?? ''),
            ),
          );
        },
      ),
    );
  }
}
