import 'package:flutter/material.dart';
import 'components/auth_button.dart';
import 'components/auth_textfield.dart';
import 'components/third_auth_button.dart';

class RegisterScreen extends StatelessWidget {
  static const String router = "/register-screen";

  const RegisterScreen({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height * 0.1,
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
                  height: MediaQuery.of(context).size.height * 0.4,
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
                      AuthTextField(
                        label: "Password",
                        hint: "Enter you password...",
                        icon: Icons.password,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: true,
                      ),
                      AuthTextField(
                        label: "Re-enter Password",
                        hint: "Re-enter you password...",
                        icon: Icons.password,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => "",
                        onSaved: (value) {},
                        isPassword: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Text("Already have account!"),
                              GestureDetector(
                                child: const Text(
                                  " Sign in",
                                  style: TextStyle(color: Colors.green),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: AuthButton(
                    onPressed: () {},
                    label: const Text(
                      "Register",
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
