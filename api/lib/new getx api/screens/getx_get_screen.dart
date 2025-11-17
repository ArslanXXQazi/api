import 'package:api/new getx api/controllers/get_controller.dart';
import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxGetScreen extends StatelessWidget {
  const GetxGetScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(GetxGetController());

    return Scaffold(
      appBar: AppBar(title: Blacktext(text: "GET API",fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,),centerTitle: true,backgroundColor: Colors.yellow,),

      body: GetBuilder<GetxGetController>(
        builder: (controller){
          if(controller.userData.isEmpty){
            return Center(child: Blacktext(text: "Loading..."));
          } else {
            return Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Blacktext(text: "Name : ${controller.userData['firstName']}"),
                            SizedBox(width: 20),
                            Blacktext(text: "Last Name : ${controller.userData['lastName']}"),
                          ],
                        ),
                        SizedBox(height: 15),
                        Blacktext(text: "Age : ${controller.userData['age']}"),
                        SizedBox(height: 15),
                        Blacktext(text: "Email : ${controller.userData['email']}"),
                        SizedBox(height: 15),
                        Blacktext(text: "Phone : ${controller.userData['phone']}"),
                        SizedBox(height: 15),
                        Blacktext(text: "Gender : ${controller.userData['gender']}"),
                        SizedBox(height: 15),
                        Blacktext(text: "Country : ${controller.userData['address']['country']}"),
                        SizedBox(height: 15),
                        Blacktext(text: "Address : ${controller.userData['address']['address']}"),


                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
