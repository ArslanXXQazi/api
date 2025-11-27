import 'package:api/new%20getx%20api/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    Center(child: Text("Search Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Notifications Screen", style: TextStyle(fontSize: 25))),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 25))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
