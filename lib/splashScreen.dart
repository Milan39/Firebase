// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          backgroundColor: Colors.redAccent,
        ),
      ),
    );
  }
}