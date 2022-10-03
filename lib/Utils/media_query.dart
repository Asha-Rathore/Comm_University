import 'package:flutter/material.dart';

class MediaQuerySize{
  static height(double h, BuildContext context){
    double sizeHeight = MediaQuery.of(context).size.height * h;
  }
  static width(double w, BuildContext context){
    double sizeHeight = MediaQuery.of(context).size.height * w;
  } 
}