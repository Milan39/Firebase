// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:login_ui/Authentication/auth_controller.dart';
import 'package:login_ui/Screen/login_page.dart';

import '../utils/App_Layout.dart';

class welcomePage extends StatelessWidget {
   String email;
   welcomePage({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    List<String> methods = ['google.png', 'twitter.png', 'facebook.png'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /** 
             * first Container which contain picture
             */
            Container(
              height: AppSize.getSize(context).height * 0.35,
              width: AppSize.getSize(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/signout.png',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.getSize(context).height * 0.22,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      maxRadius: 50,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ],
                ),
              ),
            ),
            Gap(AppSize.getHeight(20)),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: AppSize.getSize(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    email,
                    style: Styles.headline1.copyWith(color: Colors.black54),
                  ),
                  Text(
                    'milan.tilija.s21@icp.edu.np',
                    style: Styles.headline2.copyWith(color: Colors.black45),
                  )
                ],
              ),
            ),
            Gap(AppSize.getHeight(200)),
            GestureDetector(
              onTap: (){
                authController.instance.logout();
              },
              child: Container(
                height: AppSize.getHeight(55),
                width: AppSize.getWidth(200),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.getHeight(30)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/btn.png'),
                      fit: BoxFit.cover),
                ),
                child: Center(
                  child: Text(
                    'Sign out',
                    style: Styles.headline1.copyWith(fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
