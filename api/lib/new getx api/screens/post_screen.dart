
import 'package:api/new%20getx%20api/controllers/insert_controller.dart';
import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {

    InsertController insertController = Get.put(InsertController());

    return Scaffold(
      appBar: AppBar(title: Blacktext(text: "POST API2",fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,),centerTitle: true,backgroundColor: Colors.yellow,),
      body: Padding(
        padding:  EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormField(controller: insertController.nameController,decoration: InputDecoration(hintText: "Enter Name"),),
            SizedBox(height: 20),
            TextFormField(controller: insertController.yearController,decoration: InputDecoration(hintText: "Enter Year"),),
            SizedBox(height: 20),
            TextFormField(controller: insertController.priceController,decoration: InputDecoration(hintText: "Enter Price"),),
            SizedBox(height: 20),
            TextFormField(controller: insertController.cpuModelController,decoration: InputDecoration(hintText: "Enter CPU Model"),),
            SizedBox(height: 20),
            TextFormField(controller: insertController.hardSizeController,decoration: InputDecoration(hintText: "Enter Hard Size"),),
            SizedBox(height: 30),
            Obx((){

              return
              SizedBox(
                height: 60,width: 200,
                child: ElevatedButton(onPressed: (){
                  insertController.insertData();
                }, child:
                insertController.isLoading.value ? Center(child: CircularProgressIndicator()): Blacktext(text:  "SAVE",fontSize: 16,
                )),
              );

            })
          ],),
        ),
      ),

    );
  }
}
