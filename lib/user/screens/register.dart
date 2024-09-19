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

class _RegisterFormState extends State<RegisterForm>{
   
  @override
  Widget build(BuildContext context) {
     final TextEditingController userName = TextEditingController();
    final TextEditingController userEmail = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController address = TextEditingController();
    final TextEditingController mobileNumber = TextEditingController();
    final TextEditingController conPassword = TextEditingController();

    final user = UserModel(
  userName: userName.text,
  userEmail: userEmail.text,
  address: address.text,
  phone: mobileNumber.text,
  userPassword: password.text,
  date: DateTime.now(),
);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          // height: MediaQuery.of(context).size.height - 50,
          // width: double.infinity,
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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                     const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomFormField(
                      isObsecure: false,
                        myController: userName,
                        label: 'User Name',
                        icon: const Icon(Icons.person)),
                    const SizedBox(height: 20),
                    CustomFormField(
                      isObsecure: false,
                        myController: userEmail,
                        label: 'User Email',
                        icon: const Icon(Icons.email)),
                    const SizedBox(height: 20),
                    CustomFormField(
                      isObsecure: true,
                        myController: password,
                        label: 'Password',
                        icon: const Icon(Icons.password)),
                    const SizedBox(height: 20),
                    CustomFormField(
                      isObsecure: true,
                        myController: conPassword,
                        label: 'Confirm Password',
                        icon: const Icon(Icons.password)),
                         const SizedBox(height: 20),
                        CustomFormField(
                        isObsecure: false,
                        myController: mobileNumber,
                        label: 'Mobile Number',
                        icon: const Icon(Icons.numbers)),
                         const SizedBox(height: 20),
                          CustomFormField(
                      isObsecure: false,
                        myController: address,
                        label: 'Address',
                        icon: const Icon(Icons.location_city)),
                  ],
                ),
                const SizedBox(height: 20),
              RectBtn(label: 'Sign Up', onPressbutton: () {MyServices.userRegister(user,  userEmail, password, context,);}),
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
                          style:
                              TextStyle(color: Color.fromARGB(193, 244, 67, 54)),
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