import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/register_screen.dart';

import 'components/auth_button.dart';
import 'components/auth_textfield.dart';
import 'components/third_auth_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const router = "/forget-password-screen";

  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("assets/images/logo.png"),
                      const Text("LetTutor",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 40,
                              color: Colors.green))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    children: <Widget>[
                      AuthTextField(
                        label: "Email",
                        hint: "Enter you email...",
                        icon: Icons.person,
                        inputType: TextInputType.emailAddress,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: AuthButton(
                    onPressed: () {},
                    label: const Text(
                      "Reset Password",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: GestureDetector(
                    child: const Text(
                      "Goback to Login",
                      style: TextStyle(color: Colors.green),
                    ),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
