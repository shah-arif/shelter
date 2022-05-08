import 'package:flutter/material.dart';
import 'package:shelter/ui/styles/style.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  const MyFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.inputType
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: AppStyles().textFieldDecoration(hint),
    );
  }
}