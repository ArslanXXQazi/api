import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';


class InsertData extends StatelessWidget {
   InsertData({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          FloatingActionButton(
              child: Blacktext(text: "Fetch"),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchData()));})
        ],),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Blacktext(text: "Insert Data",fontSize: 24,fontWeight: FontWeight.w700,),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Insert Data Please"
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: () async {

              GetStorage getStorage = GetStorage();
              getStorage.write("name", controller.text);

            }, child: Blacktext(text: 'Insert Data'))


        ],),
      ),
    );
  }
}


class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  @override
  
  String name = '';
  GetStorage getStorage = GetStorage();
  
  void fetchData () async {

    name = await getStorage.read('name');
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Blacktext(text: 'Fetch Data',fontSize: 24,fontWeight: FontWeight.w700,),
        centerTitle: true,
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Blacktext(text: name,fontSize: 30,fontWeight: FontWeight.w600,color: Colors.blue,),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            getStorage.remove('name');
            setState(() {

            });
          }, child: Blacktext(text: "Delete"))

        ],
      ),),
    );
  }
}

