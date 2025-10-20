import 'package:api/src/get/all_users.dart';
import 'package:api/src/get/food_api.dart';
import 'package:api/src/get/get-1.dart';
import 'package:api/src/get/get_storage.dart';
import 'package:api/src/get/insert-id.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APIS',
      home: FoodApi(),
    );
  }
}
