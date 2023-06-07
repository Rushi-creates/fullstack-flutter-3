import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextFormField child;
  const TextFieldWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
        child: child,
      ),
    );
  }
}


//@ NOTE: this file is only for Ui of text field, pass actual textfield as child