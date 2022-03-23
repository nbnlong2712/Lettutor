import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/components/auth_button.dart';
import 'package:flutter_lettutor/auth/components/auth_textfield.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String router = "/change-password-screen";

  ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: Colors.black,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    children: <Widget>[
                      AuthTextField(
                        label: "Password",
                        hint: "Password",
                        icon: Icons.password,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: true,
                      ),
                      AuthTextField(
                        label: "New password",
                        hint: "Enter your new password...",
                        icon: Icons.password,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: true,
                      ),
                      AuthTextField(
                        label: "Re-enter your new password",
                        hint: "Re-enter your new password...",
                        icon: Icons.password,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: AuthButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text(
                      "Change password",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
