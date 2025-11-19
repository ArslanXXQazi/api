import 'package:api/new%20getx%20api/screens/getx_get_screen.dart';
import 'package:api/new%20getx%20api/services/repo/post-repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InsertController extends GetxController
{

  final TextEditingController idController= TextEditingController();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController yearController= TextEditingController();
  final TextEditingController priceController= TextEditingController();
  final TextEditingController cpuModelController= TextEditingController();
  final TextEditingController hardSizeController= TextEditingController();

  PostRepo postRepo = PostRepo();

  insertdata (){

    postRepo.postData(
        idController.text,
        nameController.text,
        int.parse(yearController.text),
        double.parse(priceController.text),
        cpuModelController.text,
        hardSizeController.text);

  }



}