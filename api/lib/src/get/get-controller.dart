import 'dart:math';

import 'package:api/src/controller/constants/apis.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetController extends GetxController
{

  var isLoading = false.obs;
  var error = ''.obs;
  var userImage ="".obs;
  var id=0.obs;
  var firstName = "".obs;
  var lastName = "".obs;
  var gender = "".obs;
  var age = 0.obs;
  var email= "".obs;
  var hairColor= "".obs;
  var hariStyle = "".obs;
  var address = "".obs;
  var city = "".obs;
  var state = "".obs;
  var country = "".obs;
  var university = "".obs;
  var cardNumber = "".obs;



  void fetchData  ( int userId ) async
  {
    isLoading.value=true;
    Dio dio =Dio();
   // String getUrlApi ="${AppApis.baseUrl}${AppApis.user1}";
    String getUrlApi ="https://dummyjson.com/users/${userId}";
    try{

      final response = await dio.get(getUrlApi);


      if (response.statusCode == 200 || response.statusCode==201)
      {
        final data = response.data;
        firstName.value=data['firstName'] ??"N/A";
        lastName.value=data['lastName']??"N/A";
        gender.value=data['gender']??"N/A";
        age.value=data['age']??"N/A";
        id.value=data['id']??"N/A";
        email.value=data['email']??"N/A";
        hairColor.value = data['hair']['color']??"N/A";
        hariStyle.value = data['hair']['type']??"N/A";
        address.value = data['address']['address']??"N/A";
        city.value=data['address']['city']??"N/A";
        state.value= data['address']['state']??"N/A";
        country.value=data ['address']['country']??"N/A";
        university.value= data['university']??"N/A";
        cardNumber.value=data['bank']['cardNumber']??"N/A";
        userImage.value = data['image'];
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
      error.value=e.toString();

    }
  }
}