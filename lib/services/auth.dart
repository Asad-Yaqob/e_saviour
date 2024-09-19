import 'package:e_saviour/models/user.dart';
import 'package:e_saviour/user/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyServices {
    // Method to insert user data into Firestore
    
  // Method to insert user data into Firestore
  static Future<void> addUser(UserModel user) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(user.id).set(user.toMap());
      print('User added successfully');
    } catch (e) {
      throw Exception('Error adding user: $e');
    }
  }

  
  //Register
  static  void userRegister(UserModel user, TextEditingController userEmail, TextEditingController userPass, BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userEmail.text, password: userPass.text);
          addUser(user);
          print(user);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Successful!")));

    }on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
    }
  }

//Login 
  static void userLogin(TextEditingController userEmail, TextEditingController userPass, BuildContext context) async{
    try{
     await FirebaseAuth.instance.signInWithEmailAndPassword(email: userEmail.text, password: userPass.text);

     final SharedPreferences userLog = await SharedPreferences.getInstance();
     userLog.setString("userEmail", userEmail.text);

     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successful!")));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen(),));
    } on FirebaseAuthException catch (e){
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("$e")));
    }
  }

//insert data user
}



