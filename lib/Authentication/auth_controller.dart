// ignore_for_file: slash_for_doc_comments, camel_case_types, prefer_const_constructors, avoid_print, unnecessary_null_comparison, empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_ui/Screen/login_page.dart';
import 'package:login_ui/Screen/welcome_page.dart';

class authController extends GetxController {
  /**
   * We have to access this authController globally
   * so this authController should be access in our app from everywhere with authController.instance....
   * authController is responsable for Navigating user to different pages based on user-interaction
   */
  static authController instance = Get.find();

/**
 * Declear the user variable from firbase_auth
 * include the user information like name, email, password and other 
 */
  late Rx<User?> _user;

  /**
   * make instance of firebase auth for authentication 
   * Use the property of firebase_auth package
   */
  FirebaseAuth auth = FirebaseAuth.instance;

  /**
   * Initalized the decleared variable
   */
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User>(auth.currentUser!);

    /**
     * Keeping track of the users
     * Takes parameter User.changes()
     * notify the users
     */
    _user.bindStream(auth.userChanges());
    /**
     * Ever takes listner and voidCall back function
     * here _user is the listner and _initalScreen is the voidCall back which is created below
     * whether happen to user, initalscreen will be called 
     */
    ever(_user, _initalScreen);
  }

/**
 * This function will take user as an parameter
 * if the user is null then it will show login page for creating the new user
 * if the user is already login, welcome page will be shown with the user email address
 */
  _initalScreen(User? user) {
    if (User == null) {
      print('LoginPage');
      Get.offAll(() => LoginPage());
    } else {
      print('Welcome Page');
      Get.offAll(() => welcomePage(email: user!.email!));
    }
  }

  /**
   * register method takes email and password 
   * user will register using email and password 
   * if the regestration is failed then exception is thrown with snackbar
   */
  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        'About User',
        'User message',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'About creation ',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  /**
   * Login method
   */
  void Login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar(
        'About Login',
        'Login message',
        duration: Duration(seconds: 3),
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          'Login failed ',
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  /**
   * Logout method
   */

  void logout()async{
    await auth.signOut();
  }
}
