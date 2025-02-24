import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  String hintText;
  String labelText;

   CustomTextFormField({super.key,
     required this.controller,
     required this.hintText,
     required this.labelText,
   });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        labelText:labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
