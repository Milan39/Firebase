// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

 class AppSize{
  /**
   * Gives the height and width of the sceeen
   */
  static getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

/**
 * Gives the screen height 
 */
  static getScreenHeight(){
    return Get.height;
  }

/**
 * Gives the screen width
 */
  static getScreenWidth(){
    return Get.width;
  }

  static getHeight(int pixel){
    double X = getScreenHeight()/pixel;
    return getScreenHeight()/X;
  }

  static getWidth(int pixel){
    double X = getScreenWidth()/pixel;
    return getScreenWidth()/X;
  }
}

class Styles{
  static TextStyle headline1 = TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle headline2 = TextStyle(fontSize: 18, color: Colors.grey[500]);
}

