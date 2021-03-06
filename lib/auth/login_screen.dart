import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/forget_password_screen.dart';
import 'package:flutter_lettutor/auth/register_screen.dart';
import '../home_page.dart';
import 'components/auth_button.dart';
import 'components/auth_textfield.dart';
import 'components/third_auth_button.dart';

class LoginScreen extends StatelessWidget {
  static const String router = "/login-screen";

  const LoginScreen({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height * 0.3,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Text("Not a member yet?"),
                              GestureDetector(
                                child: const Text(
                                  " Sign up",
                                  style: TextStyle(color: Colors.green),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RegisterScreen.router);
                                },
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: const Text(
                              "Forgot password",
                              style: TextStyle(color: Colors.green),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ForgetPasswordScreen.router);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: AuthButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, HomePage.router, (route) => false);
                    },
                    label: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: <Widget>[
                      const Text("Or continue with"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ThirdAuthButton(
                            thirdParty: ThirdParty.Google,
                            onPressed: () {},
                          ),
                          ThirdAuthButton(
                            thirdParty: ThirdParty.Facebook,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
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
