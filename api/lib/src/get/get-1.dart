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
      body: Center(child: Obx((){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'ID = ${getController.id.value}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              'First Name = ${getController.firstName.value}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              'Last Name = ${getController.lastName.value}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              'Gender = ${getController.gender.value}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
            Text(
              'Age = ${getController.age.value}',
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
