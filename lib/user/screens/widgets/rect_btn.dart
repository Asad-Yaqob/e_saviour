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
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
  }
}