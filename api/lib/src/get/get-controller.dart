import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetController extends GetxController
{


 var id=0.obs;
 var firstName = "".obs;
 var lastName = "".obs;
 var gender = "".obs;
 var age = "".obs;

 @override
 void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }



 void fetchData  () async
 {
   try{
     Dio dio =Dio();
     final response = await dio.get('https://dummyjson.com/users/1');
     final data = response.data;
     firstName.value=data['firstName'];
     lastName.value=data['lastName'];
     gender.value=data['gender'];
     age.value=data['age'].toString();
     id.value=data['id'];
   }
   catch (e){

     print(e.toString());

   }


 }



}