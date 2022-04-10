import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  AuthTextField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.icon,
      required this.inputType,
      required this.validator,
      required this.onSaved,
      required this.isPassword,
      required this.controller})
      : super(key: key);

  String label;
  String hint;
  IconData icon;
  TextEditingController controller;
  TextInputType inputType;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.green),
            hintText: hint,
            prefixIcon: Icon(icon, color: Colors.green,),
            fillColor: Colors.black12,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(30),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            )),
        autofocus: false,
        cursorColor: Colors.green,
        keyboardType: inputType,
        validator: validator,
        onSaved: onSaved,
        obscureText: isPassword,
      ),
    );
  }
}
