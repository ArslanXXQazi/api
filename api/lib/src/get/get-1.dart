import 'package:api/src/controller/components/black-text.dart';
import 'package:api/src/get/get-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class GetApi1 extends StatelessWidget {
  const GetApi1({super.key});

  @override
  Widget build(BuildContext context) {

    final GetController getController = Get.put(GetController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Get Api',
          style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),
        ),
      ),
      body:
      Center(child: Obx((){
         if(getController.error.value!=""){
           return Padding(
             padding: const EdgeInsets.all(20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Center(child: Blacktext(text: getController.error.value),),
                 ElevatedButton(onPressed: (){
                   getController.fetchData();
                 }, child: getController.isLoading.value ? CircularProgressIndicator() :Blacktext(text: "RETRY")),
               ],
             ),
           );
         }
         return Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CircleAvatar(
               backgroundImage: NetworkImage("${getController.userImage}"),
             ),
             Text(
               getController.isLoading.value ? "Loading...": 'ID = ${getController.id.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value ? "Loading..." : 'First Name = ${getController.firstName.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value ? "loading...":'Last Name = ${getController.lastName.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value?"loading..." :  'Gender = ${getController.gender.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value ?"Loading":'Age = ${getController.age.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value ? "Loading..." :'email = ${getController.email.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value ? "Loading..." :'Hair Style = ${getController.hariStyle.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),

             Text(
               getController.isLoading.value ? "Loading..." :'Address = ${getController.address.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value ? "Loading..." :'state = ${getController.state.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),
             Text(
               getController.isLoading.value ? "Loading..." :'City = ${getController.city.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),

             Text(
               getController.isLoading.value ? "Loading..." :'University = ${getController.university.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),

             Text(
               getController.isLoading.value ? "Loading..." :'Country = ${getController.country.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),


             Text(
               getController.isLoading.value ? "Loading..." :'Card Number = ${getController.cardNumber.value}',
               style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.w700
               ),
             ),


           ],);
      }))
      ,
    );
  }
}
