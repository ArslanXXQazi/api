import 'package:flutter/material.dart';

class Blacktext extends StatelessWidget {

final String text;
final double? fontSize;
final Color? color;
final FontWeight? fontWeight;


  const Blacktext({super.key,
     required this.text,
     this.color,
     this.fontSize,
     this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? Colors.black,
      ),
    );
  }
}