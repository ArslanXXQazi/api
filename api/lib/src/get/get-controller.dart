import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetController extends GetxController
{


 var id=0;
 var firstName = "";
 var lastName = "";
 var gender = "";
 var age = "";

 void fetchData  () async
 {
   try{
     Dio dio =Dio();
     final response = await dio.get('https://dummyjson.com/users/1');
     final data = response.data;
     firstName=data['firstName'];
     lastName=data['lastName'];
     gender=data['female'];
     age=data['age'];
     id=data['id'];
   }
   catch (e){

     print(e.toString());

   }


 }



}