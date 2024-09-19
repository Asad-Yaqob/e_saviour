import 'package:e_saviour/user/screens/login.dart';
import 'package:e_saviour/user/screens/widgets/form_field.dart';
import 'package:e_saviour/user/screens/widgets/rect_btn.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userName = TextEditingController();
    final TextEditingController userEmail = TextEditingController();
    final TextEditingController Password = TextEditingController();
    final TextEditingController ConPassword = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          // height: MediaQuery.of(context).size.height - 50,
          // width: double.infinity,
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
                      myController: userName,
                      label: 'User Name',
                      icon: const Icon(Icons.person)),
                  const SizedBox(height: 20),
                  CustomFormField(
                      myController: userEmail,
                      label: 'User Email',
                      icon: const Icon(Icons.email)),
                  const SizedBox(height: 20),
                  CustomFormField(
                      myController: Password,
                      label: 'Password',
                      icon: const Icon(Icons.password)),
                  const SizedBox(height: 20),
                  CustomFormField(
                      myController: ConPassword,
                      label: 'Confirm Password',
                      icon: const Icon(Icons.person)),
                ],
              ),
              const SizedBox(height: 20),
             const RectBtn(label: 'Sign Up',),
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
    );
  }
}
