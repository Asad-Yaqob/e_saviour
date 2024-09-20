import 'package:e_saviour/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RectBtn extends StatelessWidget {
  const RectBtn({super.key, required this.label, required this.onPressbutton});

  final String label;
  final void Function() onPressbutton;
  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                child: ElevatedButton(
                  onPressed: onPressbutton,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular( 5.0),
                      side: const BorderSide(
                          color: AppColors.lightBlueBackground ,), 
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor:  AppColors.lightBlueBackground, // Background color
                  ),
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 20, color: AppColors.navyBlue),
                  ),
                ),
              );
  }
}