import 'package:e_saviour/services/auth.dart';
import 'package:e_saviour/user/screens/widgets/form_field.dart';
import 'package:e_saviour/user/screens/widgets/rect_btn.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userEmail = TextEditingController();
    final TextEditingController userPass = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Log in",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              keyboardType: TextInputType.emailAddress,
              isObsecure: false,
                myController: userEmail,
                label: 'User Email',
                icon: const Icon(Icons.email)),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              keyboardType: TextInputType.text,
              isObsecure: true,
                myController: userPass,
                label: 'User Password',
                icon: const Icon(Icons.password)),
            const SizedBox(
              height: 20,
            ),
            RectBtn(label: 'Log In',onPressbutton: () {
              MyServices.userLogin(userEmail, userPass, context);
            },)
          ],
        ),
      ),
    );
  }
}
