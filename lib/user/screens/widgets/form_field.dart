import 'package:flutter/material.dart';  
import 'package:e_saviour/constants/app_colors.dart';

class CustomFormField extends StatelessWidget {  
  const CustomFormField({  
    super.key,  
    required this.myController,  
    required this.label,  
    required this.icon,  
    required this.isObsecure,  
    required this.keyboardType,  
    this.maxLength,  
  });  

  final TextEditingController myController;  
  final String label;  
  final Icon icon;  
  final bool isObsecure;  
  final TextInputType keyboardType;  
  final int? maxLength;  

  @override  
  Widget build(BuildContext context) {  
    return TextFormField(  
      keyboardType: keyboardType,  
      maxLength: maxLength,  
      controller: myController,  
      obscureText: isObsecure,  
      cursorColor: AppColors.disabledIconColor,
      decoration: InputDecoration(  
        fillColor:  AppColors.lightBlueBackground, // Light blue background  
        filled: true,  
        labelText: label,  
        labelStyle: const TextStyle(color: AppColors.navyBlue, fontWeight: FontWeight.bold), // Color for the label  
        prefixIcon: icon,  
        prefixIconConstraints: const BoxConstraints(  
          minWidth: 40,  
          minHeight: 24,  
        ),  
        enabledBorder: OutlineInputBorder(  
          borderRadius: BorderRadius.circular(10.0),  
          borderSide:  const BorderSide(color:  AppColors.lightBlueBackground, width: 2.0), // Light blue border  
        ),  
        focusedBorder: OutlineInputBorder(  
          borderRadius: BorderRadius.circular(10.0),  
          borderSide: const BorderSide(color: AppColors.lightBlueBackground, width: 2.0), // Darker blue on focus  
        ),  
      ),  
    );  
  }  
}