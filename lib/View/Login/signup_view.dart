import 'package:flutter/material.dart';
import 'package:tracker/View/Login/sign_in_view.dart';
import 'package:tracker/common_widget/primary_button.dart';
import 'package:tracker/common_widget/round_textfield.dart';
// import 'package:tracker/View/Login/signup_view.dart';
import 'package:tracker/common_widget/secondary_button.dart';

import '../../common/color_extension.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TColor.gray50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TColor.gray50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TColor.gray50,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TColor.gray50,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "use 8 characters or more mix of letters, numbers&symbols",
                    style: TextStyle(color: TColor.white, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              PrimaryButton(
                title: "Sign Up it's free",
                onPressed: () {
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  //   builder: (context) => const SocialLoginView(),
                  // ),
                  // );
                },
              ),
              const Spacer(),
              Text(
                "Already have an account?",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.white, fontSize: 14),
              ),
              const SizedBox(
                height: 20,
              ),
              SecondaryButton(
                title: "Sign In",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
