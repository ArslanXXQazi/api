import 'package:api/src/controller/components/black-text.dart';
import 'package:api/src/controller/constants/apis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FoodApi extends StatefulWidget {
  const FoodApi({super.key});

  @override

  State<FoodApi> createState() => _FoodApiState();
}

class _FoodApiState extends State<FoodApi> {
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  bool isLoading = false;
  String error = "";
  List <Map<String,dynamic>> foodList = [];

  void fetchData  () async
  {

    try
    {
      setState(() {});
      isLoading=true;
      Dio dio = Dio();
      String getFoodUrl = "${AppApis.foodBase}${AppApis.allFood}";
      final response = await dio.get(getFoodUrl);
      if(response.statusCode == 200 || response.statusCode == 2001 )
        {

          final foodData = response.data;
          foodList = List<Map<String,dynamic>>.from(foodData['recipes']);
          setState(() {
            isLoading=false;
          });

        }

      else{
        setState(() {
          isLoading=false;
        });
      }



    }
    catch(e)
    {
      isLoading=false;
      error = e.toString();
    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Blacktext(text: "FOOD API",fontSize: 30,fontWeight: FontWeight.w600,color: Colors.green,),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(color: Colors.green)):
      error.isNotEmpty?Center(child: Column(children: [
        Blacktext(text: error,fontSize: 18,color: Colors.red),
        SizedBox(height: 30),
        IconButton(onPressed: (){
          fetchData();
        }, icon: Icon(Icons.refresh)),
      ],),):
      ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(foodList[index]['image'])),),
                title: Blacktext(text: "${foodList[index]['name']}",fontSize: 14,fontWeight: FontWeight.w900,),
                subtitle: Row(
                  children: [
                    Blacktext(text: "Meal Type : ",fontSize: 12,fontWeight: FontWeight.w700,),
                    Blacktext(text: "${foodList[index]['mealType']}",fontSize: 12,fontWeight: FontWeight.w700,color: Colors.red,),
                  ],
                ),
                trailing: Blacktext(text: "⭐ ${foodList[index]['rating']}",fontSize: 12,color: Colors.green,fontWeight: FontWeight.w900,),

              ),
            ),
          );
        },
      ),
    );
  }
}
