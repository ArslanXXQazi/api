import 'package:api/new%20getx%20api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  List<Widget> screens = [
    HomeScreen(),
    Center(child: Text("Search Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Notifications Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 25))),
  ];

  @override
  Widget build(BuildContext context) {

    BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(()=> screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx((){

       return BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index)=>controller.changeIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notify",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        );


      })
    );
  }
}

class BottomNavController extends GetxController
{
  var currentIndex=0.obs;

  void changeIndex( int index)
  {
    currentIndex.value=index;
  }

}
