import 'package:flutter/material.dart';
import 'package:tracker/View/Login/signup_view.dart';
import 'package:tracker/View/main_tab/main_tab_view.dart';
import 'package:tracker/common_widget/primary_button.dart';
import 'package:tracker/common_widget/round_textfield.dart';
import 'package:tracker/common_widget/secondary_button.dart';

import '../../common/color_extension.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/app_logo.png",
                  width: media.width * 0.5, fit: BoxFit.contain),
              const Spacer(),
              RoundTextfield(
                hintText: "Enter your email address",
                title: "E-mail address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email address";
                  }
                  return null;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                isPassword: false,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundTextfield(
                hintText: "Enter your password",
                title: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                controller: passwordController,
                isPassword: true,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                            isRemember
                                ? Icons.check_box_rounded
                                : Icons.check_box_outline_blank_rounded,
                            color: isRemember ? TColor.secondary : TColor.white,
                            size: 22),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Remember Me",
                          style: TextStyle(color: TColor.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: TColor.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              PrimaryButton(
                title: "Sign In",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainTabView()));
                },
              ),
              const Spacer(),
              Text(
                "If You Don't have an account?",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.white, fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              SecondaryButton(
                title: "Sign Up",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupView()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
