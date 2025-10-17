
import 'package:api/src/controller/components/black-text.dart';
import 'package:api/src/controller/constants/apis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  bool isLoading=false;
  String error ="";

  List <Map<String,dynamic>> userList = [];

  void fetchData () async {

    try
    {
      setState(() {
        isLoading=true;
      });

      Dio dio =Dio();
      String getUrl = "${AppApis.baseUrl}${AppApis.getAllUser}";
      final response = await dio.get(getUrl);

      if(response.statusCode == 200 || response.statusCode == 201)
        {

          final data =response.data;

          userList = List<Map<String,dynamic>>.from(data['users']);
          setState(() {
            isLoading=false;
          });
        }


    }
    catch (e)
    {
      setState(() {
        isLoading=false;
      });
      error=e.toString();
    }


  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Blacktext(text: "Fetching All Users Data",fontSize: 20,fontWeight: FontWeight.w700,),
      ),
      body: isLoading?Center(child: CircularProgressIndicator()):
          error.isNotEmpty?Center(child: Column(children: [

            Blacktext(text: error,fontSize: 18,color: Colors.red),
            SizedBox(height: 30),
            IconButton(onPressed: (){
              fetchData();
            }, icon: Icon(Icons.refresh)),

          ],),):
              ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleUserData(userData: userList[index])));
                      },
                        leading: CircleAvatar(child: Image.network(userList[index]['image']),),
                      title: Blacktext(text: userList[index]['firstName']),
                      subtitle: Blacktext(text: userList[index]['lastName']),
                      trailing: Blacktext(text: userList[index]['id'].toString())
                    );
                  },
              )
    );
  }
}



/// Single user data class
class SingleUserData extends StatelessWidget {

  final Map<String,dynamic> userData;

  const SingleUserData({super.key,required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Blacktext(text: "${userData['firstName']} ${userData['lastName']}",fontWeight: FontWeight.w700,fontSize: 24,),
      ),
      body: Padding(
        padding:EdgeInsets.all(25),
        child: Column(children: [

          Center(
            child: CircleAvatar(
              radius: 50,
            child: Image.network(userData['image']),
            ),
          ),
          SizedBox(height: 30),
          Blacktext(text: "AGE = ${ userData['age'].toString()}"),
          SizedBox(height: 20),
          

        ],),
      ),
      
    );
  }
}
