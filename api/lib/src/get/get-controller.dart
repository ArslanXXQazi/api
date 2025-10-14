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
 var hairColor= "".obs;
 var hariStyle = "".obs;


 @override
 void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }



 void fetchData  () async
 {
   isLoading.value=true;
   Dio dio =Dio();
   String getUrlApi ="https://dummyjson.com/users/1";
   try{

     final response = await dio.get(getUrlApi);


     if (response.statusCode == 200 || response.statusCode==201)
       {
         final data = response.data;
         firstName.value=data['firstName'];
         lastName.value=data['lastName'];
         gender.value=data['gender'];
         age.value=data['age'];
         id.value=data['id'];
         email.value=data['email'];
         hairColor.value = data['hair']['color'];
         hariStyle.value = data['hair']['type'];
         
         isLoading.value=false;
       }
     else
       {
         isLoading.value=false;
         print("===============>>>ERROR<===============");
       }

   }
   catch (e){
     isLoading.value=false;
     print(e.toString());

   }


 }



}