import 'package:crypto_app/constants/app_colors.dart';
import 'package:crypto_app/constants/app_strings.dart';
import 'package:crypto_app/screens/authentication/login_Screen.dart';
import 'package:crypto_app/widget/button_widget.dart';
import 'package:crypto_app/widget/show_snack_bar.dart';
import 'package:crypto_app/widget/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isAccepted = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 7,
                left: 28.0,
                right: 28.0,
                bottom: 28.0),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Join Crypto App",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      const Text(
                        "Create your account",
                        style: TextStyle(color: AppColors.grey),
                      ),
                      const SizedBox(height: 30),
                      TextFieldWidget(
                        hintText: "First name",
                        prefixIcon: const Icon(Icons.person_3_outlined),
                        validator: (fName) {
                          if (fName!.isEmpty) {
                            ShowSnackBar.errorSnackBar(
                                text: "First name required");
                            return "First name required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        hintText: "Last name",
                        prefixIcon: const Icon(Icons.person_3_outlined),
                        validator: (lName) {
                          if (lName!.isEmpty) {
                            ShowSnackBar.errorSnackBar(
                                text: "Last name required");
                            return "Last name required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFieldWidget(
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
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isAccepted = !isAccepted;
                              });
                            },
                            child: Icon(
                              isAccepted
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: isAccepted
                                  ? AppColors.primary
                                  : AppColors.black,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Flexible(
                              child: Text(
                            "I certify that i am 18 years older, and i agree to the Terms and conditions and Privacy policy",
                            style: TextStyle(fontSize: 12),
                          ))
                        ],
                      ),
                      const SizedBox(height: 35),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(width: MediaQuery.of(context).size.width/2.5,
                            child: ButtonWidget(
                                onPressed: isAccepted
                                    ? () {
                                        if (formKey.currentState!.validate()) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LoginScreen()));
                                        }
                                      }
                                    : null,
                                text: "SIGN UP"),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  InkWell(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen())),
                      child: Text("Login",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
