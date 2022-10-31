// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:login_ui/Authentication/auth_controller.dart';
import 'package:login_ui/Screen/sign_up.dart';
import 'package:login_ui/utils/App_Layout.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController EmailController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
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
                        'assets/images/login.png',
                      ),
                      fit: BoxFit.cover)),
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
                  Text(
                    'Hello',
                    style: Styles.headline1.copyWith(color: Colors.black),
                  ),
                  Gap(5),
                  Text(
                    'Sign into your account',
                    style: Styles.headline2,
                  ),
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
                      controller: EmailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        prefix: Icon(
                          Icons.email,
                          color: Colors.deepOrangeAccent,
                        ),
                        hintText: ' Email',
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
                      controller: PasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
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
            Container(
              margin: EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Text(
                    'Forget your password?',
                    style: Styles.headline2.copyWith(fontSize: 17),
                  )
                ],
              ),
            ),
            Gap(AppSize.getHeight(20)),
            // sign in button
            InkWell(
              onTap: () {
                authController.instance.Login(
                  EmailController.text.trim(),
                  PasswordController.text.trim(),
                );
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
                    'Sign in',
                    style: Styles.headline1.copyWith(fontSize: 25),
                  ),
                ),
              ),
            ),

            Gap(AppSize.getHeight(90)),

            // Dont have an account? Create
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: Styles.headline2,
                  children: [
                    TextSpan(
                      text: ' Create',
                      style: Styles.headline2.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => signupPage()),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
