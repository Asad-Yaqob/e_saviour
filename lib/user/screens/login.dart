import 'package:e_saviour/constants/app_colors.dart';
import 'package:e_saviour/services/firebase_services.dart';
import 'package:e_saviour/user/widgets/form_field.dart';
import 'package:e_saviour/user/widgets/rect_btn.dart';
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
                color: AppColors.brightBlue,
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
                icon: const Icon(Icons.email, color: AppColors.navyBlue,)),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
              keyboardType: TextInputType.text,
              isObsecure: true,
                myController: userPass,
                label: 'User Password',
                icon: const Icon(Icons.password, color: AppColors.navyBlue,)),
            const SizedBox(
              height: 20,
            ),
            RectBtn(label: 'Log In',onPressbutton: () {
                // First, validate the input fields
                    if (userEmail.text.isEmpty || userPass.text.isEmpty ) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Please fill all fields."), backgroundColor: AppColors.darkerRed,));
                      return;
                    }
              MyServices.userLogin(userEmail, userPass, context);
            },)
          ],
        ),
      ),
    );
  }
}
