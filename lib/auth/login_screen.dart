import 'package:flutter/material.dart';
import 'package:flutter_lettutor/api/api_request.dart';
import 'package:flutter_lettutor/api/auth_request.dart';
import 'package:flutter_lettutor/auth/forget_password_screen.dart';
import 'package:flutter_lettutor/auth/register_screen.dart';
import 'package:flutter_lettutor/home_page.dart';
import 'package:flutter_lettutor/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/auth_button.dart';
import 'components/auth_textfield.dart';
import 'components/third_auth_button.dart';

late User mainUser;

class LoginScreen extends StatefulWidget {
  static const String router = "/login-screen";

  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SnackBar _snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

  @override
  void initState() {
    super.initState();
    getUserFromRefreshToken();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void getUserFromRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("access") != null) {
      print(prefs.getString("access")! + " step1");
      await AuthRequest.fetchUser().then((value) {
        mainUser = value;
        Navigator.popAndPushNamed(context, HomePage.router);
      }).catchError((e) {
        print(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          FocusScope.of(context).requestFocus(FocusNode());

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Flex(direction: Axis.vertical, children: [
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
                        height: MediaQuery.of(context).size.height * 0.3,
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
                                        Navigator.pushNamed(context, RegisterScreen.router);
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
                                    Navigator.pushNamed(context, ForgetPasswordScreen.router);
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
                          onPressed: () async {
                            if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                              String email = emailController.text;
                              String password = passwordController.text;
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await AuthRequest.fetchToken(email, password).then((value) async {
                                prefs.setString("access", value.tokens!.access!.token!);
                                prefs.setString("refresh", value.tokens!.refresh!.token!);
                                print(prefs.getString('access')! + ' step2');
                                await AuthRequest.fetchUser().then((value1) {
                                  mainUser = value1;
                                  print(value1.toString());
                                });
                                ScaffoldMessenger.of(context).showSnackBar(_snackBar("Login success!", Colors.green));
                                Navigator.popAndPushNamed(context, HomePage.router);
                              }).catchError((e) {
                                ScaffoldMessenger.of(context).showSnackBar(_snackBar("Email or password is incorrect!", Colors.red));
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(_snackBar("Please fill enough!", Colors.red));
                            }
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
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
