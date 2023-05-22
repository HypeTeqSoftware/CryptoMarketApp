import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/constants/app_strings.dart';
import 'package:crypto_app/screens/authentication/signup_screen.dart';
import 'package:crypto_app/screens/bottom_navigation_bar.dart';
import 'package:crypto_app/widget/button_widget.dart';
import 'package:crypto_app/widget/show_snack_bar.dart';
import 'package:crypto_app/widget/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: AppColors.white,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset("assets/images/container.png",
              height: MediaQuery.of(context).size.height / 5),
        ),
        Scaffold(
          backgroundColor: AppColors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      const Text(
                        "Log in to your account",
                        style: TextStyle(color: AppColors.grey),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        controller: emailController,
                        hintText: "Email Id",
                        prefixIcon: const Icon(Icons.email_outlined),
                        validator: (email) {
                          if (email!.trim().isEmpty) {
                            ShowSnackBar.errorSnackBar(
                                text: "Email ID required");
                            return "Email ID required";
                          } else if (!email.trim().isValidEmail()) {
                            ShowSnackBar.errorSnackBar(
                                text: "Invalid Email ID");
                            return "Invalid Email ID";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        hintText: "Password",
                        obscureText: true,
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 53,
                              right: 10),
                          child: Text(
                            "FORGOT",
                            style: TextStyle(
                                fontSize: 10.7,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        validator: (pass) {
                          if (pass!.isEmpty) {
                            ShowSnackBar.errorSnackBar(
                                text: "Password required");
                            return "Password required";
                          } else if (pass.length < 6) {
                            ShowSnackBar.errorSnackBar(
                                text:
                                    "Password must be more than 6 characters");
                            return "Password required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 50),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: ButtonWidget(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BottomNavBarScreen()));
                                  }
                                },
                                text: "LOGIN"),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 40,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Don't have an account? "),
                    InkWell(
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen())),
                        child: Text("Sign up",
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
