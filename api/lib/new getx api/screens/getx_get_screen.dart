import 'package:api/new getx api/controllers/get_controller.dart';
import 'package:api/new%20getx%20api/screens/user_details_screen.dart';
import 'package:api/src/controller/components/black-text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxGetScreen extends StatelessWidget {
  const GetxGetScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(GetxGetController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Blacktext(text: "GET API",fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700,),centerTitle: true,backgroundColor: Colors.yellow,),

      body: GetBuilder<GetxGetController>(
        builder: (controller){
          if(controller.isLoading.value){
            return Center(child: CircularProgressIndicator());
          }
          else {
            return ListView.builder(
              itemCount: controller.userData.length,
              itemBuilder: (context,index){

                var user = controller.userData[index];
               return Padding(
                 padding: const EdgeInsets.all(15),
                 child: GestureDetector(
                   onTap: (){
                     Get.to(UserDetailsScreen(user: user,));
                   },
                   child: Card(
                     child: Container(
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Blacktext(text: "Name : ${user['firstName']}"),
                                SizedBox(width: 20),
                                Blacktext(text: "Last Name : ${user['lastName']}"),
                              ],
                            ),
                            SizedBox(height: 15),
                            Blacktext(text: "Age : ${user['age']}"),
                            SizedBox(height: 15),
                            Blacktext(text: "Email : ${user['email']}"),
                            SizedBox(height: 15),
                            Blacktext(text: "Phone : ${user['phone']}"),
                            SizedBox(height: 15),
                            Blacktext(text: "Gender : ${user['gender']}"),
                            SizedBox(height: 15),
                            Blacktext(text: "Country : ${user['address']['country']}"),
                            SizedBox(height: 15),
                            Blacktext(text: "Address : ${user['address']['address']}"),
                          ],
                        ),
                      ),
                   ),
                 ),
               );
              },
            );
          }
        },
      ),
    );
  }
}
