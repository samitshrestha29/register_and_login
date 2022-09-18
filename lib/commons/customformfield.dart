import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    this.textInputAction = TextInputAction.next,
    required this.controller,
    required this.hinttext,
    required this.textInputType,
    this.obsure = false,
    this.validator,
    this.suffix = const Text(''),
  }) : super(key: key);
  final String hinttext;
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final bool obsure;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obsure,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: hinttext,
        suffix: suffix,
      ),
    );
  }
}
