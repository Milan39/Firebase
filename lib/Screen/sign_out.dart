// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:login_ui/Screen/welcome_page.dart';

import '../utils/App_Layout.dart';

class SignOutPage extends StatefulWidget {
  const SignOutPage({super.key});

  @override
  State<SignOutPage> createState() => _SignOutPageState();
}

class _SignOutPageState extends State<SignOutPage> {
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

            /** 
             * Second Container which has Hello and sign into your account text
             * Two TextField
             */
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              width: AppSize.getSize(context).width * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSize.getHeight(30)),
                  // first TextField
                  Container(
                    height: AppSize.getHeight(60),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppSize.getHeight(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(1, 1))
                        ]),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefix: Icon(
                          Icons.email,
                          color: Colors.deepOrangeAccent,
                        ),
                        hintText: ' User Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getHeight(30),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getHeight(30),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Gap(AppSize.getHeight(20)),
                  // second textfield
                  Container(
                    height: AppSize.getHeight(60),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppSize.getHeight(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(1, 1))
                        ]),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        prefix: Icon(
                          Icons.password,
                          color: Colors.deepOrangeAccent,
                        ),
                        hintText: ' Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getHeight(30),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getHeight(30),
                          ),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(AppSize.getHeight(10)),
            Gap(AppSize.getHeight(20)),
            Container(
              height: AppSize.getHeight(55),
              width: AppSize.getWidth(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.getHeight(30)),
                image: DecorationImage(
                    image: AssetImage('assets/images/btn.png'),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () => Get.to(() => welcomePage()),
                  child: Text(
                    'Sign in',
                    style: Styles.headline1.copyWith(fontSize: 25),
                  ),
                ),
              ),
            ),
            Gap(AppSize.getHeight(5)),
            InkWell(
              onTap: Get.back,
              child: Text(
                'Have an account?',
                style: Styles.headline2.copyWith(fontSize: 17),
              ),
            ),

            Gap(AppSize.getHeight(90)),

            // Dont have an account? Create
            RichText(
              text: TextSpan(
                text: 'Sign up using the following method',
                style: Styles.headline2.copyWith(fontSize: 17),
              ),
            ),
            Wrap(
              children: List.generate(
                  methods.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[400],
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(
                              'assets/images/' + methods[index],
                            ),
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
    ;
  }
}
