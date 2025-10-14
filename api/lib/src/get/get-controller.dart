import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetController extends GetxController
{

 var isLoading = false.obs;
 var id=0.obs;
 var firstName = "".obs;
 var lastName = "".obs;
 var gender = "".obs;
 var age = 0.obs;
 var email= "".obs;

 @override
 void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }



 void fetchData  () async
 {

   try{
     isLoading.value=true;
     Dio dio =Dio();
     final response = await dio.get('https://dummyjson.com/users/1');
     final data = response.data;
     firstName.value=data['firstName'];
     lastName.value=data['lastName'];
     gender.value=data['gender'];
     age.value=data['age'];
     id.value=data['id'];
     email.value=data['email'];
     isLoading.value=false;
   }
   catch (e){
     isLoading.value=false;
     print(e.toString());

   }


 }



}