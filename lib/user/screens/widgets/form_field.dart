import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
   const CustomFormField({super.key, required this.myController, required this.label, required this.icon});

   final TextEditingController myController;
   final String label;
   final Icon icon;

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: myController,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(193, 244, 67, 54),
          filled: true,
          labelText: label,
          labelStyle:  TextStyle(color: Theme.of(context).colorScheme.onTertiary),
          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.onTertiary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:  BorderSide(color: Theme.of(context).colorScheme.onTertiary),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your username';
          }
          return null;
        },

      );


  }
}