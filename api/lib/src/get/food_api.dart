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
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailFoodScreen(
                    foodList: foodList[index],
                  )));
                },
                leading: CircleAvatar(
                  radius: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(foodList[index]['image'])),),
                title: Blacktext(text: "${foodList[index]['name']}",fontSize: 14,fontWeight: FontWeight.w900,),
                subtitle: Blacktext(
                  text: "${foodList[index]['mealType'].join(', ')}", // List ko string mein convert karta hai
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
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


class DetailFoodScreen extends StatelessWidget {

  final Map<String,dynamic> foodList;

  const DetailFoodScreen({super.key,
    required this.foodList
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Blacktext(text: "Detail Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.red,
                child: Image.network(foodList['image'],fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 20),
            Blacktext(text: "${foodList['name']}",fontSize: 24,fontWeight: FontWeight.w700,color: Colors.red),
              SizedBox(height: 20),
              Blacktext(text: "PrepTime Minutes : ${foodList['prepTimeMinutes']}"),
              SizedBox(height: 5),
              Blacktext(text: "cookTime Minutes : ${foodList['cookTimeMinutes']}"),
              SizedBox(height: 5),
              Blacktext(text: "Ratings : ${foodList['rating']}"),
              SizedBox(height: 5),
              Blacktext(text: "Review Count : ${foodList['reviewCount']}"),
              SizedBox(height: 5),
              Blacktext(text: "Cuisine : ${foodList['cuisine']}"),
              SizedBox(height: 20),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(0),
                child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Blacktext(text: "ingredients",fontSize: 20,fontWeight: FontWeight.w700,),
                        SizedBox(height: 20),
                        Column(
                            children: foodList['ingredients'].map<Widget>((ingredients){
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: Blacktext(text: ingredients),
                                  ),

                                ],);
                            }).toList()
                        )
                      ],)
                ),
              ),
              SizedBox(height: 20),
              Card(
                color: Colors.white,
                margin: EdgeInsets.all(0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Blacktext(text: "instructions",fontSize: 20,fontWeight: FontWeight.w700,),
                      SizedBox(height: 20),
                      Column(
                        children: foodList['instructions'].map<Widget>((instructions){
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Blacktext(text: instructions),
                            ),

                          ],);
                        }).toList()
                      )
                    ],)
                ),
              ),
              SizedBox(height: 20),

          ],),
        ),
      ),
    );
  }
}

