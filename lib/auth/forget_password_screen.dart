import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/auth_request.dart';

import 'components/auth_button.dart';
import 'components/auth_textfield.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const router = "/forget-password-screen";

  ForgetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

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
                      const Text("LetTutor", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40, color: Colors.green))
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    children: <Widget>[
                      AuthTextField(
                        controller: emailController,
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
                    onPressed: () async {
                      if (emailController.text.isNotEmpty) {
                        await AuthRequest.forgotPassword(emailController.text).then((value) {
                          if(value.statusCode == 200)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(_snackBar("${value.message}!", Colors.green));
                              Navigator.pop(context);
                            }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(_snackBar("${value.message}!", Colors.red));
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please fill enough!", Colors.red));
                      }
                    },
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
                      "Back to Login",
                      style: TextStyle(color: Colors.green),
                    ),
                    onTap: () {
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
