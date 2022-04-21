import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/auth_request.dart';
import 'package:flutter_lettutor/auth/components/auth_button.dart';
import 'package:flutter_lettutor/auth/components/auth_textfield.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String router = "/change-password-screen";

  ChangePasswordScreen({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController reEnterNewController = TextEditingController();

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

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
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
                        controller: passwordController,
                        label: "Password",
                        hint: "Password",
                        icon: Icons.password,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: true,
                      ),
                      AuthTextField(
                        controller: newController,
                        label: "New password",
                        hint: "Enter your new password...",
                        icon: Icons.password,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: true,
                      ),
                      AuthTextField(
                        controller: reEnterNewController,
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
                    onPressed: () async {
                      if (passwordController.text.isNotEmpty && newController.text.isNotEmpty && reEnterNewController.text.isNotEmpty) {
                        if (newController.text.compareTo(reEnterNewController.text) == 0) {
                          await AuthRequest.changePassword(passwordController.text, newController.text).then((value) {
                            if (value.statusCode == 200) {
                              ScaffoldMessenger.of(context).showSnackBar(_snackBar("${value.message}!", Colors.green));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(_snackBar("${value.message}!", Colors.red));
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please re-enter new password!", Colors.red));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please fill enough!", Colors.red));
                      }
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
