import 'package:flutter/material.dart';
import 'package:flutter_lettutor/auth/login_screen.dart';
import 'package:flutter_lettutor/main.dart';
import 'package:flutter_lettutor/models/tutor.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'components/auth_button.dart';
import 'components/auth_textfield.dart';

class RegisterScreen extends StatefulWidget {
  static const String router = "/register-screen";

  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reEnterController = TextEditingController();

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

  @override
  void initState() {
    super.initState();
    dao.openDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Flex(
              direction: Axis.vertical,
              children: [
                SizedBox(
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
                            const Text("LetTutor", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 40, color: Colors.green))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
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
                            AuthTextField(
                              controller: passwordController,
                              label: "Password",
                              hint: "Enter you password...",
                              icon: Icons.password,
                              inputType: TextInputType.visiblePassword,
                              validator: (value) => "",
                              onSaved: (value) {},
                              isPassword: true,
                            ),
                            AuthTextField(
                              controller: reEnterController,
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
                          onPressed: () {
                            if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty && reEnterController.text.isNotEmpty) {
                              if (passwordController.text.compareTo(reEnterController.text) == 0) {
                                if (dao.isEmailDuplicateUser(emailController.text)) {
                                  ScaffoldMessenger.of(context).showSnackBar(_snackBar("Email is duplicate!", Colors.red));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(_snackBar("Register successful!", Colors.green));
                                  User newUser = User("", passwordController.text, "", emailController.text, "Vietnam", "0943290648",
                                      ["Vietnamese", "English"], DateTime(2000, 3, 12), "Beginner", "Student", [], false);
                                  dao.addUser(newUser);
                                  Navigator.popAndPushNamed(context, LoginScreen.router);
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(_snackBar("Re-enter password, please!", Colors.red));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please fill enough!", Colors.red));
                            }
                          },
                          label: const Text(
                            "Register",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
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
