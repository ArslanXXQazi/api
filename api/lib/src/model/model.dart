import 'package:flutter/material.dart';

class SupportModel
{
  String? url;
  String? text;

  SupportModel({required this.url,required this.text});

  static SupportModel fromMap (Map<String,dynamic>map){

  return SupportModel(
    url: map['url'],
    text:map['text']
);

}

}
