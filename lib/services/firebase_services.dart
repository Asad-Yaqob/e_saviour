import 'package:e_saviour/constants/app_colors.dart';
import 'package:e_saviour/models/user.dart';
import 'package:e_saviour/user/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyServices {
  
  // Method to insert user data into Firestore
  static Future<void> addUser(UserModel user) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.id)
          .set(user.toMap());
    } catch (e) {
      throw Exception('Error adding user: $e');
    }
  }

  //Register
  static void userRegister(UserModel user, TextEditingController userEmail,
      TextEditingController userPass, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail.text, password: userPass.text);
      addUser(user);
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration Successful!"), backgroundColor: AppColors.navyBlue));
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      // Handling different error codes for better user experience
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = "This email is already in use.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is invalid.";
          break;
        case 'weak-password':
          errorMessage = "The password is too weak.";
          break;
        default:
          errorMessage = e.message ?? "An error occurred during registration.";
      }

      // Show error message
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage), backgroundColor: AppColors.darkerRed,));
      }
    } catch (e) {
      // General error handling
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("An unexpected error occurred: $e"), backgroundColor: AppColors.darkerRed,));
      }
    }
  }

//Login
  static void userLogin(TextEditingController userEmail,
      TextEditingController userPass, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userEmail.text, password: userPass.text);

      final SharedPreferences userLog = await SharedPreferences.getInstance();
      userLog.setString("userEmail", userEmail.text);
      if (context.mounted) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login Successful!") ,backgroundColor: AppColors.navyBlue,));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SplashScreen(),
            ));
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e"), backgroundColor: AppColors.darkerRed,));   
      }
    }
  }

//insert data user
}
