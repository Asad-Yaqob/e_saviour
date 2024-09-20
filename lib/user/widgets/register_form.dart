import 'package:e_saviour/user/widgets/form_field.dart';
import 'package:flutter/material.dart';

class MyRegisterForm extends StatelessWidget {
  const MyRegisterForm({
    super.key,
    required this.userEmail,
    required this.userName,
    required this.password,
    required this.conPassword,
    required this.mobileNumber,
    required this.address,
  });

  final TextEditingController userName;
  final TextEditingController userEmail;
  final TextEditingController password;
  final TextEditingController conPassword;
  final TextEditingController mobileNumber;
  final TextEditingController address;


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomFormField(
              keyboardType: TextInputType.text,
              isObsecure: false,
              myController: userName,
              label: 'User Name',
              icon: const Icon(
                Icons.person,
                color: Color(0xFF0D47A1),
              )),
          const SizedBox(height: 20),
          CustomFormField(
              keyboardType: TextInputType.emailAddress,
              isObsecure: false,
              myController: userEmail,
              label: 'User Email',
              icon: const Icon(Icons.email, color: Color(0xFF0D47A1))),
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
    );
  }
}
