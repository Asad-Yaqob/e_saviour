import 'package:flutter/material.dart';

class RectBtn extends StatelessWidget {
  const RectBtn({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              );
  }
}