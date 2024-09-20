import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_saviour/models/user.dart';
import 'package:e_saviour/user/screens/login.dart';
import 'package:e_saviour/user/screens/widgets/form_field.dart';
import 'package:e_saviour/user/screens/widgets/rect_btn.dart';
import 'package:flutter/material.dart';
import 'package:e_saviour/services/auth.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  // Defining the controllers globally within the class
  final TextEditingController userName = TextEditingController();
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController conPassword = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    userEmail.dispose();
    password.dispose();
    address.dispose();
    mobileNumber.dispose();
    conPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 60.0),
                    const Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Column(
                  children: [
                    CustomFormField(
                       keyboardType: TextInputType.text,
                        isObsecure: false,
                        myController: userName,
                        label: 'User Name',
                        icon: const Icon(Icons.person, color: Color(0xFF0D47A1),)),
                    const SizedBox(height: 20),
                    CustomFormField(
                      keyboardType: TextInputType.emailAddress,
                        isObsecure: false,
                        myController: userEmail,
                        label: 'User Email',
                        icon: const Icon(Icons.email,color: Color(0xFF0D47A1) )),
                    const SizedBox(height: 20),
                    CustomFormField(
                      keyboardType: TextInputType.text,
                        isObsecure: true,
                        myController: password,
                        label: 'Password',
                        icon: const Icon(Icons.password, color: Color(0xFF0D47A1))),
                    const SizedBox(height: 20),
                    CustomFormField(
                      keyboardType: TextInputType.text,
                        isObsecure: true,
                        myController: conPassword,
                        label: 'Confirm Password',
                        icon: const Icon(Icons.password, color: Color(0xFF0D47A1))),
                    const SizedBox(height: 20),
                    CustomFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 11,
                        isObsecure: false,
                        myController: mobileNumber,
                        label: 'Mobile Number',
                        icon: const Icon(Icons.numbers, color: Color(0xFF0D47A1))),
                    const SizedBox(height: 20),
                    CustomFormField(
                      keyboardType: TextInputType.streetAddress,
                      maxLength: 60,
                        isObsecure: false,
                        myController: address,
                        label: 'Address',
                        icon: const Icon(Icons.location_city, color: Color(0xFF0D47A1))),
                  ],
                ),
                const SizedBox(height: 20),
                RectBtn(
                    label: 'Sign Up',
                    onPressbutton: () {
                      // First, validate the input fields
                      if (userName.text.isEmpty ||
                          userEmail.text.isEmpty ||
                          password.text.isEmpty ||
                          address.text.isEmpty ||
                          mobileNumber.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please fill all fields.")));
                        return;
                      }

                      if (password.text != conPassword.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Passwords do not match.")));
                        return;
                      }

                      final user = UserModel(
                        userName: userName.text,
                        userEmail: userEmail.text,
                        address: address.text,
                        phone: mobileNumber.text,
                        createdAt: Timestamp.now(),
                        updatedAt: Timestamp.now(),
                      );
                      MyServices.userRegister(
                          user, userEmail, password, context);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginForm()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Color.fromARGB(193, 244, 67, 54)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
